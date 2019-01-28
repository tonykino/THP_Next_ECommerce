# frozen_string_literal: true

class DropAdressesTable < ActiveRecord::Migration[5.2]
  def change
    remove_table :adresses
  end
end
