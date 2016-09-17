class Tactic < ApplicationRecord
	has_many :sim_units
	has_many :unit_tactics
	has_many :units, through: :unit_tactics
	accepts_nested_attributes_for :unit_tactics,:reject_if => :all_blank, :allow_destroy => true
end
