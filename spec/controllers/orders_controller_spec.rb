# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      user = create(:user)
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      @user = create(:user)
      sign_in @user
      @order = Order.create(total: "22", user_id: @user.id)
      get :show, params: { id: @order.id }
      expect(response).to have_http_status(:success)
    end
  end
end
