class SimTurn < ApplicationRecord
	has_many :sim_armies, :inverse_of => :sim_turn
	accepts_nested_attributes_for :sim_armies, :allow_destroy => true
end
