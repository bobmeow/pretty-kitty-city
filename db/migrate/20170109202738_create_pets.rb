class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :mood_level, :default => 5
      t.integer :owner_id

      t.timestamps
    end
  end
end
