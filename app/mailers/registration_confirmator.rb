class RegistrationConfirmator < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_confirmator.confirm.subject
  #
  def confirm
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
