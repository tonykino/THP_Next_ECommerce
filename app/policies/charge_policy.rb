# frozen_string_literal: true

class ChargePolicy < ApplicationPolicy
  def new?
    record.user_id == user.id && record.total.positive?
  end

  def create?
    record.user_id == user.id
  end
end
