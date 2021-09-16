# Preview all emails at http://localhost:3000/rails/mailers/attendant_mailer
class AttendantMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/attendant_mailer/info
  def info
    AttendantMailer.info
  end

end
