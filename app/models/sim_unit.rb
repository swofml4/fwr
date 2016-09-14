class SimUnit < ApplicationRecord
	belongs_to :sim_army
	belongs_to :unit
	belongs_to :tactic, required: false
end
