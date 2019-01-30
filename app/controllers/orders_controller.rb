# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  def index
    @order = current_user.orders
  end

  def show; end

  private

    def set_order
      @order = Order.find(params[:id]).order_items
    end
end
