# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  PHONE_REGEXP = /(\+375|80) (29|44|33|25) \d{3}-\d{2}-\d{2}/
  EMAIL_REGEXP = URI::MailTo::EMAIL_REGEXP

  self.abstract_class = true
end
