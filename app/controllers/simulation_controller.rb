require 'dice_roller'
class SimulationController < ApplicationController
  def index
  	@simulations = Simulation.all.order(id: :desc)
  end

  def dice_roll
  	loaded_dice = DiceRoller.new
  	# def roll_dice(num_rolls=1, advantage=0, dice_sides=10, prefer_higher=true)
  	if !params[:advantage].nil? and !params[:dice].nil?
  		@dice_rolls = loaded_dice.roll_dice(params[:dice].to_i,params[:advantage].to_i)
  		@advantage = params[:advantage].to_i
  		@dice = params[:dice].to_i
  	end
  end

  def grid
  end

  def make_army
  	sim_backend = SimulationBackend.new
  	sim_backend.pick_armies()
  	sim_backend.next_turn()
  	sim_backend.next_turn()
  	redirect_to simulation_grid_path, notice: 'Simulation with armies was successfully updated.'
  end

  def one_simulation
  	@points = 200
  	if !params[:points].nil? 
  		sim_backend = SimulationBackend.new
  		sim_backend.pick_armies(params[:points].to_i)
  		sim_backend.next_turn()
  		redirect_to simulation_index_path, notice: 'Simulation with armies was successfully created.'
  	end
  end
  
end
