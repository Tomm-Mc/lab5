class Monster < ApplicationRecord
  has_many:tweets
  validates :name, :birthdate, presence: true
  validate :telefono

    def telefono
        if PhoneValidator.new(phone).valid?
            return
        else
          errors.add(:phone, :invalid)
        end
    end
end
