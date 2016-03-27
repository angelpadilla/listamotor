class AdminController < ApplicationController
	layout 'admin'
	def home
		check_super
    @cars = Pin.all.order(created_at: :desc)
	end
end
