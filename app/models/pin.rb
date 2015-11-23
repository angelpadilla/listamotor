class Pin < ActiveRecord::Base
	belongs_to :user
	belongs_to :state
	belongs_to :brand

  has_many :galleries, dependent: :destroy
  accepts_nested_attributes_for :galleries
	

  scope :cities, -> {select(:city).distinct} 


	Gasoline = [
		['Gasolina', 'gasolina'],
		['Diesel', 'diesel'],
	]
end
