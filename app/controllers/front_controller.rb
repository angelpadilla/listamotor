class FrontController < ApplicationController
	before_action :set_store, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show, :cheap, :no_cheap, :classics, :modern]


  def index
  	@cars = @q.result(distinct: true).order(created_at: :desc).paginate(page: params[:page], per_page: PAGINATE)
  end


  # perfil usuario
  def show
  	@cars = @store.pins.order(created_at: :desc).paginate(page: params[:page], per_page: PAGINATE)
  end

  # todas los usuarios o tiendas
  def stores
    @stores = User.order(name: :desc)
  end

  def cheap
    @cars = Pin.cheap.paginate(page: params[:page], per_page: PAGINATE)
  end
  def no_cheap
    @cars = Pin.no_cheap.paginate(page: params[:page], per_page: PAGINATE)
    
  end
  def classics
    @cars = Pin.classics.paginate(page: params[:page], per_page: PAGINATE)
  end
  def modern
    @cars = Pin.modern.paginate(page: params[:page], per_page: PAGINATE)
  end

  def my_cars
    @cars = current_user.pins.order(updated_at: :desc).paginate(page: params[:page], per_page: 50)   
  end

  def likes
    @likes = current_user.likes.order(created_at: :desc).paginate(page: params[:page], per_page: 50)
  end


  private
  	def set_store
  		@store = User.find(params[:id])
  	end
end
