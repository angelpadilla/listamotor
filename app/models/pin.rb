class Pin < ActiveRecord::Base
	belongs_to :user
	belongs_to :state
	belongs_to :brand

  has_many :galleries, dependent: :destroy
  has_many :likes, dependent: :destroy
  accepts_nested_attributes_for :galleries
	

  scope :cities, -> {select(:city).distinct} 

  scope :cheap, -> {order(price: :asc)} 
  scope :no_cheap, -> {order(price: :desc)} 
  scope :classics, -> {where(year: 1880..(Time.now.year - 30)).order(year: :asc)} 
  scope :modern, -> {where(year: (Time.now.year - 5)..(Time.now.year)).order(year: :desc)} 


	Gasoline = [
		['Regular', 'regular'],
		['Diesel', 'diesel'],
		['Otro', 'otro'],
	]



	private
		# ransacker :year do
	 #    Arel.sql("to_char(\"#{table_name}\".\"year\", '99999')")
	 #  end
	 
end
