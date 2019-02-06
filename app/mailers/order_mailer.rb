# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default from: 'no-reply@ruby-t.com'

  def admin_order_email
    @admin = 'admin@example.com'
    mail(to: @admin, subject: 'Vous avez une nouvelle commande')
  end

  def customer_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Confirmation de votre commande sur Ruby-t.com')
  end
end
