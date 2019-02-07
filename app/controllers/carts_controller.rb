# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :cart_content

  def show; end

  private

    def cart_content
      @order = current_order
      @order_items = @order.order_items
    end
end
