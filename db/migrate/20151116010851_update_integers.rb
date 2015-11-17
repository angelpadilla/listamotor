class UpdateIntegers < ActiveRecord::Migration
  def change
  	change_column :pins, :phone, :integer, limit: 8
  	change_column :pins, :km, :integer, limit: 8
  	change_column :pins, :price, :integer, limit: 8
  end
end
