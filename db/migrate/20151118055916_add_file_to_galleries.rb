class AddFileToGalleries < ActiveRecord::Migration
  
  def up
    add_attachment :galleries, :photo
    add_reference :galleries, :pin, index: true, foreign_key: true
  end

  def down
    remove_attachment :galleries, :photo
  end
end
