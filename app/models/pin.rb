class Pin < ActiveRecord::Base
	belongs_to :user
	belongs_to :state
	belongs_to :brand

  scope :cities, -> {select(:city).distinct} 


	Gasoline = [
		['Gasolina', 'gasolina'],
		['Diesel', 'diesel'],
	]
end
