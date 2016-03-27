class FrontController < ApplicationController
	before_action :set_store, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
  	@cars = @q.result(distinct: true).order(updated_at: :desc).paginate(page: params[:page], per_page: 4)
  end

  def show
  	@pins = @store.pins
  end

  def my_cars
    @cars = current_user.pins.order(updated_at: :desc).paginate(page: params[:page], per_page: 50)   
  end

  def stores
    @stores = User.order(name: :desc)
  end

  def likes
    @likes = current_user.likes.order(created_at: :desc).paginate(page: params[:page], per_page: 50)
  end

  private
  	def set_store
  		@store = User.find(params[:id])
  	end
end
