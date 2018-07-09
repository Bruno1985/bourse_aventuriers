class AddFieldToAdventure < ActiveRecord::Migration[5.2]
  def change
    add_column :adventures, :listing_name, :stringt
  end
end
