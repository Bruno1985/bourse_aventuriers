class AddCountryToAdventure < ActiveRecord::Migration[5.2]
  def change
    add_column :adventures, :countries, :string
  end
end