# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  def create?
    record.user_id == user.id
  end

  def update?
    record.user_id == user.id
  end

  def destroy?
    record.user_id == user.id
  end

  def show?
    record.user_id == user.id
  end
end
