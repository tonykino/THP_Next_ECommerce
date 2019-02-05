# frozen_string_literal: true

class AdministrationController < ApplicationController
  before_action :authenticate_admin!
  layout 'administration'

  private

    def authenticate_admin!
      authenticate_user!
      redirect_to root_url unless current_user.admin
    end
end
