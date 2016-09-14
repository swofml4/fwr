class DiceRoller

	# returns a hash of the number of dice rolled, the sides each die has, the selected dice, 
	# and the rejected dice (due to advantage/disadvantage)
	# the prefer_higher is so that if the user wanted advantage to discard high rolls, 
	# they could set the high preference to false
	def roll_dice(num_rolls=1, advantage=0, dice_sides=10, prefer_higher=true)
		dice_rolls = Array.new(num_rolls + advantage.abs) { rand(1..dice_sides) }
		rejected_rolls = []
		dice_rolls.sort!
		if advantage != 0
			if (advantage < 0 and prefer_higher == true) or (advantage > 0 and prefer_higher != true)
				#discard high values, no change needed
			else
				#discard low values, need to reverse the array
				dice_rolls.reverse!
			end
			advantage.abs.times do
				rejected_rolls.push dice_rolls.pop
			end
		end
		roll_hash = {:num_rolls => num_rolls, :advantage => advantage, :dice_sides => dice_sides, 
					:dice_rolls => dice_rolls, :rejected_rolls => rejected_rolls}
		return roll_hash #not needed, but not explicitly calling out the return feels weird
	end
end