class User < ApplicationRecord
  belongs_to :province
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates :address, presence: true
  validates :province_id, presence: true, numericality: { only_integer: true }
  validates :postal_code, presence: true
end
