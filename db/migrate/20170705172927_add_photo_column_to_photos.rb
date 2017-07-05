class AddPhotoColumnToPhotos < ActiveRecord::Migration[5.1]
  def up
    add_attachment :photos, :attached_photo
  end
  def down
    remove_attachment :photos, :attached_photo
  end
end
