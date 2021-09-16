# Preview all emails at http://localhost:3000/rails/mailers/declaration_mailer
class DeclarationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/declaration_mailer/send_seat
  def send_seat
    DeclarationMailer.send_seat
  end

end
