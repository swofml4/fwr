class UnitAttribute < ApplicationRecord
	has_and_belongs_to_many :units
	has_and_belongs_to_many :unit_attribute_types
end
