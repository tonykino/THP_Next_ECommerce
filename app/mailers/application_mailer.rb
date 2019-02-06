# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@ruby-t.com'
  layout 'mailer'
end
