# Preview all emails at http://localhost:3000/rails/mailers/pickup_mailer
class PickupMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/pickup_mailer/pickup_scheduled
  def pickup_scheduled
    PickupMailer.pickup_scheduled
  end

end
