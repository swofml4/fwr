class UnitTactic < ApplicationRecord
	belongs_to :unit
	belongs_to :tactic
	accepts_nested_attributes_for :unit, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :tactic,:reject_if => :all_blank, :allow_destroy => true
end
