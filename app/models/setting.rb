class Setting < ApplicationRecord
  before_validation :set_key!, unless: Proc.new { |s| s.new_user_key.present? }
  validates :new_user_key, presence: true

  # Creates key for allowing sign ups
  def set_key!
    self.new_user_key = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
  end
end