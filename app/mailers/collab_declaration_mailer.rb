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

  def fail
    @collab_declaration = params[:collab_declaration]
    @collaborator = @collab_declaration.event_collaborator.collaborator
    @event = @collab_declaration.event
    mail(
      to: @collaborator.email,
      subject: "Algo no anda bien 😢"
    )
  end
end
