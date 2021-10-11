class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_event2, only: [:attendants, :collaborators]

  def index
    @events = Event.all
  end

  def show
    @event_collaborator = EventCollaborator.new
    @attendants = @event.attendants
    @collaborators = @event.event_collaborators
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Culto #{@event.name}",
        page_size: 'Letter',
        template: "events/show.html.erb",
        layout: "pdf.html",
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.seats = ["A1", "A2", "A3", "A4", "A5", "A6", "B1", "B2", "B3", "B4", "B5", "B6", "C1", "C2", "C3", "C4", "C5", "C6", "D1", "D2", "D3", "D4", "D5", "D6", "E1", "E2", "E3", "E4", "E5", "E6", "F1"]
    @event.collabs = 13
    @event.quantity = 32

    if @event.save
      redirect_to root_path
    else
      flash[:alert] = "Algo no funcionó correctamente."
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to root_path
      flash[:notice] = "El evento ha sido actualizado con éxito."
    else
      flash[:alert] = "Algo no funcionó correctamente."
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  def admin
    @events = Event.all
  end

  def attendants
    @attendants = @event.attendants
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Culto #{@event.name}",
        page_size: 'Letter',
        template: "events/attendants.html.erb",
        layout: "pdf.html",
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  def collaborators
    @collaborators = @event.event_collaborators
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Culto #{@event.name}",
        page_size: 'Letter',
        template: "events/collaborators.html.erb",
        layout: "pdf.html",
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end
  private

  def set_event
    @event = Event.find(params[:id])
    # authorize @event
  end

  def set_event2
    @event = Event.find(params[:event_id])
  end

  def event_params
    params.require(:event).permit(:name, :date, :quantity, :seats)
  end
end
