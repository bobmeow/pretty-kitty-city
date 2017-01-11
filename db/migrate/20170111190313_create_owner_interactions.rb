class CreateOwnerInteractions < ActiveRecord::Migration[5.0]
  def change
    create_table :owner_interactions do |t|
      t.string :kind
      t.integer :owner_id 
      t.timestamps
    end
  end
end
