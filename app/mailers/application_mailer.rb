# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'online_booking@system.com'
  layout 'mailer'
end
