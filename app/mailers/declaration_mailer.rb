class DeclarationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.declaration_mailer.send_seat.subject
  #

  def send_seat
    @declaration = params[:declaration]
    @attendant = @declaration.attendant
    @event = @attendant.event
    mail(to: @attendant.email, subject: "Nos vemos hoy! 🥳")
  end
end
