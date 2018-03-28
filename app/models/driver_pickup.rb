class DriverPickup < ApplicationRecord
  belongs_to :driver
  belongs_to :pickup
end