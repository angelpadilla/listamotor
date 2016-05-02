class HomeController < ApplicationController
	layout 'front'
  skip_before_action :authenticate_user!

	def front
	end
end
