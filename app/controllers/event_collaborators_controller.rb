class EventCollaboratorsController < ApplicationController
  before_action :find_event, only: [:new, :create]
  before_action :find_event_collaborator, only: [:edit, :update, :destroy]
  def new
    @event_collaborator = EventCollaborator.new
  end

  def create
      @event_collaborator = @event.event_collaborators.new(event_collaborator_params)

      if @event_collaborator.save
        if @event.collabs == 0
          @event.quantity = @event.quantity - 1
        else
          @event.collabs = @event.collabs - 1
        end
        @event.save
        redirect_to @event
      else
        flash[:alert] = "Algo no funcionó correctamente."
      end

  end

  def edit
  end

  def update
    if @event_collaborator.update(event_collaborator_params)
      redirect_to event_path(@event_collaborator.event)
      flash[:notice] = "El colaborador ha sido actualizado con éxito."
    else
      flash[:alert] = "Algo no funcionó correctamente."
      render :edit
    end
  end

  def destroy
    if @event_collaborator.destroy
      @event = @event_collaborator.event
      if @event.event_collaborators.size >= 10
        @event.quantity = @event.quantity + 1
      else
        @event.collabs = @event.collabs + 1
      end
      @event.save
      redirect_to event_path(@event_collaborator.event)
      flash[:notice] = "El colaborador ha sido eliminado."
    else
      redirect_to event_path(@event_collaborator.event)
      flash[:alert] = "Algo no funcionó correctamente."
    end
  end

  private

  def event_collaborator_params
    params.require(:event_collaborator).permit(:seat, :collaborator_id, :collab_seat_id)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_event_collaborator
    @event_collaborator = EventCollaborator.find(params[:id])
  end
end
