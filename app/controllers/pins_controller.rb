class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  # before_action :check_property, only: [:edit, :update]
  skip_before_action :authenticate_user!, only: [:show]

  require "uri"
  require "net/http"
  # GET /pins
  # GET /pins.json
  def index
    # @pins = Pin.all.order(created_at: :desc)
    # admin check super or editor
    @pins = current_user.pins.order(created_at: :desc)
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
  end

  # GET /pins/new
  def new
    @pin = Pin.new

    @states = State.all
    @brands = Brand.all
  end

  # GET /pins/1/edit
  def edit
    check_property(@pin)
    @states = State.all
    @brands = Brand.all
  end

  # POST /pins
  # POST /pins.json
  def create
    if params[:pin][:photo_0]
      puts "----------------------------------"
      puts "true"
      puts "----------------------------------"
    end
    @pin = current_user.pins.new(pin_params)
    respond_to do |format|
      if verify_recaptcha(model: @pin) && @pin.save
        if params[:photos]
          # params[:photos].each { |photo| @product.galleries.create(photo: photo) }
          params[:photos].each do |photo|
            @p = Gallery.new(photo: photo, pin_id: @pin.id)
            @p.save
          end
        end
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new}
        format.json { render json: @pin.errors, status: :unprocessable_entity }
        flash[:notice] = 'Se produjo un error intenta nuevamente.'
      end
    end

  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    check_property(@pin)
    if params[:pin][:photo_0]
      puts "----------------------------------"
      puts "true"
      puts "----------------------------------"
    end

    respond_to do |format|
      if verify_recaptcha(model: @pin) && @pin.update(pin_params)
        # if params[:photos]
        #   # params[:photos].each { |photo| @product.galleries.create(photo: photo) }
        #   params[:photos].each do |photo|
        #     @p = Gallery.new(photo: photo, pin_id: @pin.id)
        #     @p.save
        #   end
        # end
        pin = params[:pin]
        if pin[:photo_0] or pin[:photo_1] or pin[:photo_2]
          @p = Gallery.new(photo: params[:pin][:photo_0], pin_id: @pin.id)
          @p.save
        end
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.galleries.each do |f|
      f.photo = nil
    end
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:title, :desc, :brand_id, :state_id, :color, :gasoline, :transmission, :city, :air, :ambiental_verification, :tenencias_pagadas, :km, :year, :price, :phone, :doors, :galleries)
    end
end
