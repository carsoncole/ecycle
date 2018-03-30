class Pickup < ApplicationRecord
  belongs_to :driver, optional: true
  has_many :charges
  has_many :donations
  validates :name, :email, :street_address, presence: true

  SIZES = ['Small (Less than 10lbs)', 'Medium (10-20lbs)', 'Large (20-35lbs)', 'Extra Large (More than 35lbs)']

end