# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    before_action :set_item, only: %i[edit show update destroy]
    def index
      @items = Item.paginate(page: params[:page])
    end

    def show; end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      @item.save
      redirect_to administration_items_path
    end

    def edit; end

    def update
      @item.update(item_params)
      redirect_to administration_items_path
    end

    def destroy
      @item.destroy
      redirect_to administration_items_path
    end

    private

      def set_item
        @item = Item.find(params[:id])
      end

      def item_params
        params.require(:item).permit(:name, :description, :price )
      end
  end
end
