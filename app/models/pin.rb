class Pin < ActiveRecord::Base
	belongs_to :user
	belongs_to :state
	belongs_to :brand

  has_many :galleries, dependent: :destroy
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :galleries
	

  scope :cities, -> {select(:city).distinct} 


	Gasoline = [
		['Regular', 'regular'],
		['Diesel', 'diesel'],
		['Otro', 'otro'],
	]
	private
		ransacker :year do
	    Arel.sql("to_char(\"#{table_name}\".\"year\", '99999')")
	  end
	 
end
