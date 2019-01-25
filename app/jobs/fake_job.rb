# frozen_string_literal: true

class FakeJob < ApplicationJob
  queue_as :default

  def perform(*args); end
end
