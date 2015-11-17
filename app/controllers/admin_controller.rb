class AdminController < ApplicationController
	layout 'admin'
	def home
		check_super
	end
end
