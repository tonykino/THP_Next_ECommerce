# frozen_string_literal: true

class OrderItemsController < ApplicationController
  def create
    @order = current_order
    order_item = OrderItem.new(order_id: @order.id,
                               item_id: params[:item_id],
                               quantity: 1)
    order_item.save
    @order.save
    session[:order_id] = @order.id
    redirect_to cart_path, notice: "Item added"
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_item_params)
    redirect_back fallback_location: cart_path, notice: "Item updated"
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    redirect_back fallback_location: cart_path, alert: "Item removed from cart"
  end

  private

    def order_item_params
      params.require(:order_item).permit(:quantity)
    end
end
