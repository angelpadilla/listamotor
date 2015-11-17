class RemoveModel < ActiveRecord::Migration
  def change
  	remove_column :pins, :model
  end
end
