class User < ApplicationRecord
    validate :email_must_be_valid_and_not_disposable
  
    def phone_must_be_argentinian
      if PhoneValidator.new(phone).valid?
        return
      else
        errors.add(:phone, :invalid)
      end
    end
  end