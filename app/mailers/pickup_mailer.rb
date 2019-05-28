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
    setting = Setting.last
    if setting
      admins = []
      if setting.general_contact_email.present?
        admins << "#{setting.general_contact_name.present? ? setting.general_contact_name : setting.general_contact_email}<#{setting.general_contact_email}>"
      end
      if setting.pickup_contact_email.present?
        admins << "#{setting.pickup_contact_name.present? ? setting.pickup_contact_name : setting.pickup_contact_email} <#{setting.pickup_contact_email}>"
      end
      mail(to: admins, subject: "Ecycle Pickup Scheduled: #{@pickup.email}")
    end
  end
end
