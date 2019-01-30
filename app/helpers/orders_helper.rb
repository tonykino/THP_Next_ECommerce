# frozen_string_literal: true

module OrdersHelper
  def current_order
    if session[:order_id].any?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
