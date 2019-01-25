# frozen_string_literal: true

class CreateProfils < ActiveRecord::Migration[5.2]
  def change
    create_table :profils do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
