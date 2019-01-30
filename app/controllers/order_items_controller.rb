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
    redirect_back fallback_location: cart_path, notice: "Item ajouté au panier"
  end

  def update
    # @order = current_order
    # @order_item = @order.order_items.find(params[:id])
    # @order_item.update_attributes(update_order_item_params)
    # redirect_back fallback_location: cart_path, notice: "Item update"
  end

  def destroy
    # @order = current_order
    # @order_item = @order.order_items.find(params[:id])
    # @order_item.destroy
    # redirect_back fallback_location: cart_path, alert: "Item retiré du panier"
  end

  # private
  #
  # def new_order_item_params
  #   params.require(:order_item).permit(:item_id)
  # end
  #
  # def update_order_item_params
  #   params.require(:order_item).permit(:quantity)
  # end
end
