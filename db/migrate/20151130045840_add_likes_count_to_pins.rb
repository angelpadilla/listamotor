class AddLikesCountToPins < ActiveRecord::Migration
  def change
  	add_column :pins, :likes_count, :integer, default: 0

  end
end
