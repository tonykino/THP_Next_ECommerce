# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
