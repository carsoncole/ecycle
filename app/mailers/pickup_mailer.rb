class PickupMailer < ApplicationMailer
  layout 'mailer'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pickup_mailer.pickup_scheduled.subject
  #
  def pickup_scheduled(pickup_id)
    @pickup = Pickup.find(pickup_id)
    @greeting = "Hi"

    mail(to: "#{@pickup.name} <#{@pickup.email}>", subject: 'Your eCycle pickup is scheduled')
  end
end
