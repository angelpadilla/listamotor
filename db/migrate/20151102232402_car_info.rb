class CarInfo < ActiveRecord::Migration
  def change

  	add_reference :pins, :brand, index: true, foreign_key: true
  	add_reference :pins, :state, index: true, foreign_key: true

  	add_column :pins, :color, :string
  	add_column :pins, :gasoline, :string
  	add_column :pins, :transmission, :string
  	add_column :pins, :model, :string
  	add_column :pins, :city, :string
  	
  	add_column :pins, :air, :boolean
  	add_column :pins, :ambiental_verification, :boolean
  	add_column :pins, :tenencias_pagadas, :boolean

  	add_column :pins, :km, :integer
  	add_column :pins, :year, :integer
  	add_column :pins, :price, :integer
  	add_column :pins, :phone, :integer
  	add_column :pins, :doors, :integer, default: 2

  end
end
