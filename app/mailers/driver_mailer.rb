class DriverMailer < ApplicationMailer
  layout 'mailer'


  def pickups(driver_id)
    @driver = Driver.find(driver_id)
    @pickups = @driver.pickups
    mail(to: "#{@driver.name} <#{@driver.email}>", subject: 'Your pickups')
  end

end