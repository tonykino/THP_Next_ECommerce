# frozen_string_literal: true

module Administration
  class OrdersController < AdministrationController
    def index
      @orders = Order.all_except('biding').order(:status)
    end

    def show
      @orders = Order.find(params[:id])
      @order_items = @orders.order_items
    end

    def update
      @orders = Order.find(params[:id])
    end

    def create
      @orders = Order.find(params[:order_id])
      @orders.update(status: "treated")
      redirect_to administration_orders_path, notice: "Vous avez bien validé votre commande"
    end
  end
end
