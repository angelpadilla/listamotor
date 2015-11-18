class FrontController < ApplicationController
	before_action :set_store, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
  	@cars = @q.result(distinct: true).order(created_at: :desc)
  end

  def show
  	@pins = @store.pins
  end

  def my_cars
    @cars = current_user.pins.order(created_at: :desc)    
  end

  def stores
    @stores = User.order(created_at: :desc)
  end

  private
  	def set_store
  		@store = User.find(params[:id])
  	end
end
