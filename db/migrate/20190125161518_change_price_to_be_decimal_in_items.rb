# frozen_string_literal: true

class ChangePriceToBeDecimalInItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :price, :decimal
  end

  def down
    change_column :items, :price, :integer
  end
end
