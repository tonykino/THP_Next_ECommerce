# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :set_current_order
  before_action :set_order_item, only: %i[update destroy]

  def create
    @order_item = OrderItem.create!(order_id: @order.id,
                                    item_id: params[:item_id],
                                    quantity: 1)
    @order.save
    session[:order_id] = @order.id
    redirect_to cart_path, notice: "Item added"
  end

  def update
    @order_item.update(order_item_params)
    @order.save
    redirect_back fallback_location: cart_path, notice: "Item updated"
  end

  def destroy
    @order_item.destroy
    @order.save
    redirect_back fallback_location: cart_path, alert: "Item removed from cart"
  end

  private

    def order_item_params
      params.require(:order_item).permit(:quantity)
    end

    def set_current_order
      @order = current_order
    end

    def set_order_item
      @order_item = @order.order_items.find(params[:id])
    end
end
