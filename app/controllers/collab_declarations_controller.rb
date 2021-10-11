class CollabDeclarationsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_collab_declaration, only: [:show, :collab_ready]
  before_action :find_event_collaborator, only: :create
  before_action :find_event, only: [:new, :create]


  def new
    @collab_declaration = CollabDeclaration.new
  end

  def create
    @collab_declaration = CollabDeclaration.new(collab_declaration_params)
    @collab_declaration.event = @event
    @collab_declaration.event_collaborator = @event_collaborator

      if @collab_declaration.save
        if @collaborator.email?
          if @collab_declaration.qb || @collab_declaration.qc || @collab_declaration.qd1 || @collab_declaration.qd2 || @collab_declaration.qd3 || @collab_declaration.qe1 || @collab_declaration.qe2 || @collab_declaration.qe3 || @collab_declaration.qe4 || @collab_declaration.qe5 || @collab_declaration.qe6 || @collab_declaration.qe7 || @collab_declaration.qe8
            mail = CollabDeclarationMailer.with(collab_declaration: @collab_declaration).fail
            mail.deliver_now
          else
            mail = CollabDeclarationMailer.with(collab_declaration: @collab_declaration).send_seat
            mail.deliver_now
          end
        end
        redirect_to "/collab_ready/#{@collab_declaration.id}"
      else
        flash[:alert] = "Algo no funcionó correctamente."
        render :new
      end
  end

  def show
    @collaborator = @collab_declaration.event_collaborator.collaborator
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Declaración Jurada #{@collab_declaration.event_collaborator.event} - #{@collaborator}",
        page_size: 'Letter',
        template: "collab_declarations/show.html.erb",
        layout: "pdf.html",
        orientation: "Portrait",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  def collab_ready
    @collaborator = @collab_declaration.event_collaborator.collaborator
  end

  private

  def set_collab_declaration
    @collab_declaration = CollabDeclaration.find(params[:id])
    # authorize @declaration
  end

  def set_declaration_ready
    @declaration = Declaration.find(declaration_params)
  end

  def collab_declaration_params
    params.require(:collab_declaration).permit(:rut, :qa, :qb, :qc, :qd1, :qd2, :qd3, :qe1, :qe2, :qe3, :qe4, :qe5, :qe6, :qe7, :qe8)
  end

  def find_event_collaborator
    rut = params[:collab_declaration][:rut]
    @collaborator = Collaborator.find_by(rut: rut.upcase)
    @event_collaborator = EventCollaborator.find_by(collaborator_id: @collaborator.id)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
