# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :street_number
      t.string :route
      t.string :locality
      t.string :administrative_area_level_1
      t.string :country
      t.string :postal_code
      t.text :full_address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
