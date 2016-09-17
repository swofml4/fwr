class Unit < ApplicationRecord
	belongs_to :army
	has_and_belongs_to_many :unit_attributes
	belongs_to :unit_type
	has_many :sim_units
	has_many :unit_tactics
	has_many :tactics, through: :unit_tactics
	accepts_nested_attributes_for :unit_tactics, :reject_if => :all_blank, :allow_destroy => true
end
