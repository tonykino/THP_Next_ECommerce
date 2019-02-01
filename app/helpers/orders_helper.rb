# frozen_string_literal: true

module OrdersHelper
  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      order = Order.create(user_id: current_user.id)
      session[:order_id] = order.id
      order
    end
  end
end
