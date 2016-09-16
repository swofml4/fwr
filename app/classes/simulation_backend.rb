class SimulationBackend
	# key class variables
	# @current_board		the actual current position of each unit as well as any terrain
	# @planning_board		a scratch space that can be freely used to plan an army's move
	# @simulation
	# 	@sim_turns
	# 		@current_turn	the key data store for simulation which gets saved to the database after the turn is done
	#			@events
	#			@sim_armies
	#				@sim_units

	def initialize
		@board_size = 24
		@simulation = Simulation.new
		@current_turn = @simulation.sim_turns.new(:turn_count => 0)
		@current_board = Array.new(@board_size) {Array.new(@board_size)}
		@simulation.save!
		@current_turn.save!
	end

	def pick_armies(point_cost=250, num_armies=2)
		#this isnt super efficient, but it is db agnostic unlike Army.limit(num_armies).order("RAND()")
		@armies = Army.all.shuffle[0..(num_armies-1)] 
		#this is hella inefficent
		@armies.each do |army|
			puts '~~~~~~~~~~~~~selected army ' + army.name
			current_sim_army = @current_turn.sim_armies.new(:army_id => army.id)
			current_sim_army.save!
			remaining_points = point_cost
			# I need to check how this caches. ideally I run a full pull once and then run off a ram cache
			units = army.units.where("sim_cost is ? and cost <= ? or sim_cost <= ?",nil, remaining_points, remaining_points).shuffle
			while !units.first.nil? do
				current_sim_army.sim_units.new(:unit_id => units.first.id, :hp => units.first.hp)
				if units.first.sim_cost.nil?
					remaining_points -= units.first.cost
				else
					remaining_points -= units.first.sim_cost
				end
				puts 'selected ' + units.first.name
				puts 'points remaining: ' + remaining_points.to_s
				units = army.units.where("sim_cost is ? and cost <= ? or sim_cost <= ?",nil, remaining_points, remaining_points).shuffle
			end
			current_sim_army.save!
		end
	end

	def deploy_armies
		deploy_back = 0
		deploy_front = 5
		@current_turn.sim_armies.each do |sim_army|
			place_position = @board_size / 2 - sim_army.sim_units.count
			sim_army.sim_units.each do |sim_unit|
				sim_unit.pos_x = place_position
				sim_unit.pos_y = deploy_front
				place_position += 1
			end
		end
		@current_turn.save!
	end

	def enemies_in_range(sim_unit)
	end

	def enemies_could_be_in_range(sim_unit)
	end

	# looks at all the armies and compares their range strength, saving the result to the respective turn armies
	# this can then later be used in tactic assessments
	def compare_ranged_strength
	end

	# looks at the board and identifies the fewest number of valid fights
	# todo: make this take account of priority
	# should the return be a hash of arrays of the units?
	def identify_melees
	end

	# goes down the list and up the list of the units having each select their optimal assess_one_tactic
	# it then selects the approach with the highest aggregate score and assigns each unit the respective tactic
	def select_army_tactics
		@current_turn.sim_armies.each do |sim_army|
			sim_army.sim_units.each do |sim_unit|
				select_unit_tactic(sim_unit)
			end
		end
	end

	def select_unit_tactic(sim_unit)
		#later will make it assess tactics, for now, just select the first

	end

	def assess_one_tactic
	end

	# takes an army and for each unit which can engage in melee and has selected a melee tactic, attempts to maximize the units engaged
	# not sure if this makes sense to bias to point cost or unit number. I think point cost
	def charge_the_enemy
	end

	# takes an army and each unit that doesn't have a charge or shoot tactic (who can charge/shoot), manuvers the unit
	# units which have a shoot or charge tactic that cannot do so will be processed here
	def manuver
	end

	# units which have a shoot tactic, can shoot, and havent moved, will shoot
	# those that can't will note that they tried to shoot but were obstructed
	# units will attempt to find the best target starting with the unit with the fewest targets in range
	# to the unit with the most (to maximize the number who can shoot assuming targets get killed)
	def shoot_the_enemy 
	end

	# checks if any army is at the point of a psych test. if they are, it processes the even
	def psych_test
	end

	# not sure if I will use this. if the event processing can be generalized, I will. 
	# every type of action (except movement?) should process an event for logging
	# these events could be used to show the step by step results of a simulation
	def run_event
	end

	# runs all the movement, shooting, melee, and psych checks
	def process_turn
		#select tactics
		select_army_tactics()
		#charge_the_enemy (both sides)
		# should they reevaluate tactics or just do it once?
		#manuver (both sides)
		#shoot_the_enemy (both sides)
		#resolve melees
		#psych test
	end

	# saves off the previous turn and sets up the simulation for the next turn
	# returns true if a next turn will happen, false if only one side remains
	def next_turn
		puts "~~~~~~~~~~~~~~~~NEXT TURN"
		# save turn
		@current_turn.save!
		# check if we are done
		# if not, create a new turn which is a deep clone of the previous with turn_count incremented
		temp_turn = @simulation.sim_turns.new(:turn_count => @current_turn.turn_count + 1)
		@current_turn.sim_armies.each do |sim_army|
			temp_army = temp_turn.sim_armies.new(:army_id => sim_army.army_id)
			sim_army.sim_units.each do |sim_unit|
				temp_unit = temp_army.sim_units.new(:unit_id => sim_unit.unit_id, :hp => sim_unit.hp)
			end
		end
		temp_turn.save!
		@current_turn = temp_turn
	end

	# after the simulation, assess how much of an adjustment should be made to each unit's cost
	# How to value each unit is going to be very difficult.
	def unit_cost_adjustment
	end
end