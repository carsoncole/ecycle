class SendPickupConfirmationJob < ApplicationJob
  queue_as :default

  def perform(pickup_id)
    
  end
end
