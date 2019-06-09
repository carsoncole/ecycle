class ApplicationMailer < ActionMailer::Base
  helper_method :settings
  default from: "from@example.com"
  layout 'mailer'

  def settings
    Setting.last ? Setting.last : Setting.create
  end
end
