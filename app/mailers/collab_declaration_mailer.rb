class CollabDeclarationMailer < ApplicationMailer

  def send_seat
    @collab_declaration = params[:collab_declaration]
    @event_collaborator = @collab_declaration.event_collaborator
    @collaborator = @collab_declaration.event_collaborator.collaborator
    @event = @collab_declaration.event
    mail(
      to: @collaborator.email,
      subject: "Nos vemos hoy! 🥳"
    )
  end
end
