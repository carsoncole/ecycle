class Pickup < ApplicationRecord
  belongs_to :driver, optional: true
  has_many :donations

  validates :name, :email, :street_address, presence: true
end