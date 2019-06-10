class Setting < ApplicationRecord
  before_validation :set_key!, unless: Proc.new { |s| s.new_user_key.present? }
  validates :new_user_key, presence: true

  def initialize(args)
    super(args)
    self.brief_marketing_message = "Support Scouting! We will recycle your unused iPhones, iPads, printers and small appliances. Simply drop-off or schedule a pickup. Donations appreciated." if self.brief_marketing_message.nil? && !self.persisted?
  end

  # Creates key for allowing sign ups
  def set_key!
    self.new_user_key = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
  end
end