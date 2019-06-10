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

  def admin_pickup_scheduled(pickup_id)
    @pickup = Pickup.find(pickup_id)
    if settings
      admins = []
      if settings.general_contact_email.present?
        admins << "#{settings.general_contact_name.present? ? settings.general_contact_name : settings.general_contact_email}<#{settings.general_contact_email}>"
      end
      if settings.pickup_contact_email.present?
        admins << "#{settings.pickup_contact_name.present? ? settings.pickup_contact_name : settings.pickup_contact_email} <#{settings.pickup_contact_email}>"
      end
      mail(to: admins.uniq, subject: "Ecycle Pickup Scheduled: #{@pickup.email}")
    end
  end
end
