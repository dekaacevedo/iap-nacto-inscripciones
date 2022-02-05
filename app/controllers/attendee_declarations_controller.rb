class AttendeeDeclarationsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_attendee_declaration, only: [:show, :ready]
  before_action :find_event_attendee, only: :create
  before_action :find_event, only: [:new, :create]


  def new
    @attendee_declaration = AttendeeDeclaration.new
  end

  def create
    @attendee_declaration = AttendeeDeclaration.new(attendee_declaration_params)
    @attendee_declaration.event = @event
    @attendee_declaration.event_attendee = @event_attendee

      if @attendee_declaration.save
        if @attendee.email?
          if @attendee_declaration.qb || @attendee_declaration.qc || @attendee_declaration.qd1 || @attendee_declaration.qd2 || @attendee_declaration.qd3 || @attendee_declaration.qe1 || @attendee_declaration.qe2 || @attendee_declaration.qe3 || @attendee_declaration.qe4 || @attendee_declaration.qe5 || @attendee_declaration.qe6 || @attendee_declaration.qe7 || @attendee_declaration.qe8
            mail = AttendeeDeclarationMailer.with(attendee_declaration: @attendee_declaration).send_seat
            mail.deliver_now
          else
            mail = AttendeeDeclarationMailer.with(attendee_declaration: @attendee_declaration).fail
            mail.deliver_now
          end
        end
        redirect_to "/ready2/#{@attendee_declaration.id}"
      else
        flash[:alert] = "Algo no funcionó correctamente."
        render :new
      end
  end

  def show
    @attendee = @attendee_declaration.event_attendee.attendee
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Declaración Jurada #{@attendee_declaration.event_attendee.event} - #{@attendee}",
        page_size: 'Letter',
        template: "attendee_declarations/show.html.erb",
        layout: "pdf.html",
        orientation: "Portrait",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  def ready
    @attendee = @attendee_declaration.event_attendee.attendee
  end

  private

  def set_attendee_declaration
    @attendee_declaration = AttendeeDeclaration.find(params[:id])
    # authorize @declaration
  end


  def attendee_declaration_params
    params.require(:attendee_declaration).permit(:rut, :qa, :qb, :qc, :qd1, :qd2, :qd3, :qe1, :qe2, :qe3, :qe4, :qe5, :qe6, :qe7, :qe8)
  end

  def find_event_attendee
    rut = params[:attendee_declaration][:rut]
    @event = Event.find(params[:event_id])
    @event_attendee = @event.event_attendees.find_by(id: params[:attendee_declaration][:event_attendee_id])
    @attendee = @event_attendee.attendee
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
