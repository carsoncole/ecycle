class ApplicationMailer < ActionMailer::Base
  helper_method :settings
  layout 'mailer'

  def settings
    Setting.last ? Setting.last : Setting.create
  end
end
