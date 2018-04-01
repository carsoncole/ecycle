class Pickup < ApplicationRecord
  belongs_to :driver, optional: true
  has_many :charges
  has_many :donations
  validates :name, :email, :street_address, :key, presence: true

  SIZES = ['Small (Less than 10lbs)', 'Medium (10-20lbs)', 'Large (20-35lbs)', 'Extra Large (More than 35lbs)']

  geocoded_by :address
  before_validation :set_key!, unless: Proc.new { |p| p.key.present? }
  after_validation :geocode

  def address
    street_address + ', ' + 'Bainbridge Island, WA, US'
  end

  def set_key!
    self.key = [*('a'..'z'),*('0'..'9')].shuffle[0,12].join
  end
end