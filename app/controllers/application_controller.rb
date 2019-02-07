# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include OrdersHelper
  include Pundit
end
