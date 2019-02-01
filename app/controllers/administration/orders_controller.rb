# frozen_string_literal: true

module Administration
  class OrdersController < AdministrationController
    before_action :set_orders, only: %i[index]
    before_action :set_order, only: %i[show create]
    before_action :set_order_items, only: %i[create]

    def index; end

    def show; end

    def create
      @order.update(status: "treated")
      redirect_back fallback_location: administration_orders_path, notice: "Vous avez bien validé votre commande"
    end

    private

      def set_orders
        @orders = Order.all_except('biding').order(:status)
      end

      def set_order
        @order = Order.find(params[:id])
      end

      def set_order_items
        @order_items = @order.order_items
      end
  end
end
