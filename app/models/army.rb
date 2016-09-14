class Army < ApplicationRecord
	has_many :units, :inverse_of => :army
	accepts_nested_attributes_for :units, :allow_destroy => true, 
		:reject_if => proc { |attributes| attributes['_destroy'] == '1' }
end
