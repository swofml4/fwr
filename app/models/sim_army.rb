class SimArmy < ApplicationRecord
	belongs_to :army
	belongs_to :sim_turn
	has_many :sim_units, :inverse_of => :sim_army
	accepts_nested_attributes_for :sim_units, :allow_destroy => true
end
