class User < ApplicationRecord

  validates_presence_of :first_name, :last_name, :birthday
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9!@#$%^&*()]+\.)+[a-z0-9!@#$%^&*()]{2,})\z/i, message: :invalid_email_format
end