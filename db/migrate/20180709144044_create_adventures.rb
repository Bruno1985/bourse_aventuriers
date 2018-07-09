class CreateAdventures < ActiveRecord::Migration[5.2]
  def change
    create_table :adventures do |t|
      t.string :main_activity
      t.text :summary
      t.string :address
      t.integer :number_of_teammates
      t.date :date_of_departure
      t.integer :duration
      t.boolean :is_trekking
      t.boolean :is_trail
      t.boolean :is_alpinism
      t.boolean :is_climbing
      t.boolean :is_cycling
      t.boolean :is_alpinism
      t.boolean :is_motorbike
      t.boolean :is_sailing
      t.boolean :is_camping
      t.boolean :is_skiing
      t.boolean :is_fishing
      t.string :is_mountain_bike
      t.boolean :is_kayaking
      t.boolean :is_diving
      t.boolean :is_dog_sledding
      t.boolean :is_horse_riding
      t.boolean :is_paragliding
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
