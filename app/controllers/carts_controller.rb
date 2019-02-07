# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :cart_content
  before_action :authorize_user

  def show; end

  private

    def cart_content
      @order = current_order
      @order_items = @order.order_items
    end

    def authorize_user
      authorize @order
    end
end
