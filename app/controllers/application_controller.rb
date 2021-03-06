class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Tools
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_search, :set_likes_list

  before_filter :configure_permitted_parameters, if: :devise_controller?
  layout 'application'

  def set_likes_list
    if user_signed_in?
      @likes_list = current_user.likes.order(created_at: :desc).limit(6)
    end
  end

  protected

    def set_search
      @q = Pin.ransack(params[:q])
      @states = State.all
      @brands = Brand.all

    end

  	def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:sign_up) << :captcha
  		devise_parameter_sanitizer.for(:sign_up) << :captcha_key
      devise_parameter_sanitizer.for(:account_update) << :name
      devise_parameter_sanitizer.for(:account_update) << :captcha
      devise_parameter_sanitizer.for(:account_update) << :captcha_key
      devise_parameter_sanitizer.for(:account_update) << :phone
      devise_parameter_sanitizer.for(:account_update) << :city
  		devise_parameter_sanitizer.for(:account_update) << :state_id
  	end
    def after_sign_in_path_for(resource)
      index_path
    end
    
end
