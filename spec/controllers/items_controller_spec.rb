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
    before(:each) do
      @item = FactoryBot.create :item
      get :show, params: { id: @item.id }
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
