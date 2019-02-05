# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_out_path_for(_resource)
    root_path
  end
  include OrdersHelper
end
