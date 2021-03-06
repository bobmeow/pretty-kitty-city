class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :email
      t.integer :caramel_points, :default => 0

      t.timestamps
    end
  end
end
