class Unit < ApplicationRecord
	belongs_to :army
	has_and_belongs_to_many :unit_attributes
	belongs_to :unit_type
	has_many :sim_units
end
