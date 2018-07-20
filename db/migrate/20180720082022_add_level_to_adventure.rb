class AddLevelToAdventure < ActiveRecord::Migration[5.2]
  def change
    add_column :adventures, :level, :string
  end
end