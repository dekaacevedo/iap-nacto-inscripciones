class EventCollaboratorsController < ApplicationController
  before_action :find_event, only: [:new, :create]
  before_action :find_event_collaborator, only: [:edit, :update, :destroy, :extra]

  def extra
    respond_to :html, :js
  end


  def new
    @event_collaborator = EventCollaborator.new
  end

  def create
      @event_collaborator = EventCollaborator.new(event_collaborator_params)
      @event_collaborator.event = @event
      if @event_collaborator.save
        @event.collab_seat.push(@event_collaborator.seat)
        if @event.collabs == 0
          @event.quantity = @event.quantity - 1
        else
          @event.collabs = @event.collabs - 1
        end
        @event.save
        redirect_to event_path(@event, anchor: "collaborator-#{@event_collaborator.id}")
      else
        flash[:alert] = "Algo no funcionó correctamente."
      end

  end

  def edit
  end

  def update
    old_seat = @event_collaborator.seat
    if @event_collaborator.update(event_collaborator_params)
      @event_collaborator.event.collab_seat.delete(old_seat)
      @event_collaborator.event.collab_seat.push(@event_collaborator.seat)
      @event_collaborator.event.save
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
      @event.collab_seat.delete(@event_collaborator.seat)
      if @event.event_collaborators.size >= 13
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
    params.require(:event_collaborator).permit(:seat, :collaborator_id, :temperature)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_event_collaborator
    @event_collaborator = EventCollaborator.find(params[:id])
  end
end
