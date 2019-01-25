# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::StaticPagesController, type: :controller do
  describe "GET #hello_admin" do
    it "returns http success" do
      get :hello_admin
      expect(response).to have_http_status(:success)
    end
  end
end
