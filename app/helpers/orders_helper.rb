# frozen_string_literal: true

module OrdersHelper
  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.create(user_id: current_user.id)
    end
  end
end
