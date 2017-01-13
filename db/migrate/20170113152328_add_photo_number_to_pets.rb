class AddPhotoNumberToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :photo_number, :integer
  end
end
