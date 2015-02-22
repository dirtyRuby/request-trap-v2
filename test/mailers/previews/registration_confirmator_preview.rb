# Preview all emails at http://localhost:3000/rails/mailers/registration_confirmator
class RegistrationConfirmatorPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/registration_confirmator/confirm
  def confirm
    RegistrationConfirmator.confirm
  end

end
