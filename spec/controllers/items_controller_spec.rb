# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    before do
      get :show, params: { id: @item.id }
    end
    let(:item) { Item.create(name: 'Black tea', description: 'whowh', price: 12) }
  end
end
