class AddMoodLevelToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :mood_level, :integer
  end
end
