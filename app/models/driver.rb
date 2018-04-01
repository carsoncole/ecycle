class Driver < ApplicationRecord
  has_many :pickups

  def address
    street_address + ', ' + 'Bainbridge Island, WA, US'
  end
end