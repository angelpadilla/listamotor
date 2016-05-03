class State < ActiveRecord::Base
	has_many :pins
	has_many :users
end
