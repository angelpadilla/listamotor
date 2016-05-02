class PinsController < ApplicationController
  include Tools
  
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  # before_action :check_property, only: [:edit, :update]
  skip_before_action :authenticate_user!, only: [:show]

  require "uri"
  require "net/http"
  # GET /pins
  # GET /pins.json
  def index
    redirect_to my_cars_path
    @pins = Pin.all.order(created_at: :desc)
    # admin check super or editor
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
    @image_count = 5 

  end

  # GET /pins/1/edit
  def edit
    check_property(@pin)
    @image_count = 5 - @pin.galleries.count
    @states = State.all
    @brands = Brand.all
  end

  # POST /pins
  # POST /pins.json
  def create
    
    @pin = current_user.pins.new(pin_params)
    respond_to do |format|
      if verify_recaptcha(model: @pin) && @pin.save
        pin = params[:pin]
        if pin[:photo_0] or pin[:photo_1] or pin[:photo_2] or pin[:photo_3] or pin[:photo_4]
          pin_0 = Gallery.create(photo: pin[:photo_0], pin_id: @pin.id)
          pin_1 = Gallery.create(photo: pin[:photo_1], pin_id: @pin.id)
          pin_2 = Gallery.create(photo: pin[:photo_2], pin_id: @pin.id)
          pin_3 = Gallery.create(photo: pin[:photo_3], pin_id: @pin.id)
          pin_4 = Gallery.create(photo: pin[:photo_4], pin_id: @pin.id)
        end
        format.html { redirect_to @pin, notice: 'Creado correctamente.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { redirect_to new_pin_path, notice: "Se produjo un error intenta nuevamente."}
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    check_property(@pin)
    respond_to do |format|
      if verify_recaptcha(model: @pin) && @pin.update(pin_params)
        pin = params[:pin]
        if pin[:photo_0] or pin[:photo_1] or pin[:photo_2] or pin[:photo_3] or pin[:photo_4]
          pin_0 = Gallery.create(photo: pin[:photo_0], pin_id: @pin.id)
          pin_1 = Gallery.create(photo: pin[:photo_1], pin_id: @pin.id)
          pin_2 = Gallery.create(photo: pin[:photo_2], pin_id: @pin.id)
          pin_3 = Gallery.create(photo: pin[:photo_3], pin_id: @pin.id)
          pin_4 = Gallery.create(photo: pin[:photo_4], pin_id: @pin.id)
        end
        format.html { redirect_to @pin, notice: 'Actualizado correctamente!' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { redirect_to edit_pin_path(@pin), notice: "Se produjo un error intenta nuevamente." }
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
      format.html { redirect_to my_cars_path, notice: 'Destruido correctamente' }
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
