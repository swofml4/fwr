class Simulation < ApplicationRecord
	belongs_to :simulation_collection, :required => false
	has_many :sim_turns
	accepts_nested_attributes_for :sim_turns, :allow_destroy => true
end
