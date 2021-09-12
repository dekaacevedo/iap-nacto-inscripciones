class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

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
  private

  def set_event
    @event = Event.find(params[:id])
    # authorize @event
  end

  def event_params
    params.require(:event).permit(:name, :date, :quantity)
  end
end
