class SimulationCollection < ApplicationRecord
	has_many :simulations
	accepts_nested_attributes_for :simulations, :allow_destroy => true
end
