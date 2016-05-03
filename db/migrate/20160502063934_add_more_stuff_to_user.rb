class AddMoreStuffToUser < ActiveRecord::Migration
  def change
  	add_column :users, :phone, :string
  	add_column :users, :city, :string
  	add_reference :users, :state, index: true, foreign_key: true
  end
end
