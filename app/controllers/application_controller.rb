class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Tools
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :set_search, :set_likes_list

  before_filter :configure_permitted_parameters, if: :devise_controller?
  layout 'application'

  protected
    def set_likes_list
      @likes_list = current_user.likes.order(created_at: :desc).limit(6)
    end

    def set_search
      @q = Pin.ransack(params[:q])
      @states = State.all
      @brands = Brand.all
    end

  	def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:sign_up) << :captcha
  		devise_parameter_sanitizer.for(:sign_up) << :captcha_key
      # devise_parameter_sanitizer.for(:sign_up) << :twitter
      # devise_parameter_sanitizer.for(:sign_up) << :avatar
  		# devise_parameter_sanitizer.for(:sign_up) << :role
      devise_parameter_sanitizer.for(:account_update) << :name
      devise_parameter_sanitizer.for(:account_update) << :captcha
  		devise_parameter_sanitizer.for(:account_update) << :captcha_key
      # devise_parameter_sanitizer.for(:account_update) << :twitter
      # devise_parameter_sanitizer.for(:account_update) << :avatar
      # devise_parameter_sanitizer.for(:account_update) << :web_profile
  		# devise_parameter_sanitizer.for(:account_update) << :role
  	end
end
