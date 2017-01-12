class CreateFriendshipInteractions < ActiveRecord::Migration[5.0]
  def change
    create_table :friendship_interactions do |t|
      t.integer :friendship_id
      t.string :kind
      t.timestamps
    end
  end
end
