class AddFieldToAdventure < ActiveRecord::Migration[5.2]
  def change
    add_column :adventures, :listing_name, :string
    add_column :adventures, :latitude, :float
    add_column :adventures, :longitude, :float
    
  end
end
