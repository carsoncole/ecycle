class Charge < ApplicationRecord
  belongs_to :pickup, optional: true
end
