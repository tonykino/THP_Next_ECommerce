# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include OrdersHelper
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized_error

  private

    def not_authorized_error
      flash[:alert] = 'Vous ne pouvez pas faire ça !'
      redirect_back fallback_location: root_path
    end
end
