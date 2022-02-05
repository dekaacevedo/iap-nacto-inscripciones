class EventAttendeesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :find_event, only: [:new, :create]
  before_action :find_event_attendee, only: [:edit, :update, :destroy, :extra]

  def extra
    respond_to :html, :js
  end


  def new
    @event_attendee = EventAttendee.new
  end

  def create
      @event_attendee = EventAttendee.new(event_attendee_params)
      @event_attendee.event = @event

      if @event_attendee.save
        @event.quantity = @event.quantity - 1
        @event.seats.push(@event_attendee.seat)
        @event.save
        regex = /\A[\w|.|-]+@[\w|-]+\.\w+\z/
        # if regex.match?(@attendee.email)
        #   mail = AttendantMailer.with(attendant: @attendee).info
        #   mail.deliver_now
        # else
        #   mail = AttendantMailer.with(attendant: @attendee).info_without_email
        #   mail.deliver_now
        # end
        redirect_to success_path
      else
        flash[:alert] = "Algo no funcionó correctamente."
        render :new
      end

  end

  def edit
  end

  def update
    old_seat = @event_attendee.seat
    if @event_attendee.update(event_attendee_params)
      @event_attendee.event.seats.delete(old_seat)
      @event_attendee.event.seats.push(@event_attendee.seat)
      @event_attendee.event.save
      redirect_to event_path(@event_attendee.event)
      flash[:notice] = "El asistente ha sido actualizado con éxito."
    else
      flash[:alert] = "Algo no funcionó correctamente."
      render :edit
    end
  end

  def destroy
    if @event_attendee.destroy
      @event = @event_attendee.event
      @event.quantity = @event.quantity + 1
      @event.seats.delete(@event_attendee.seat)
      @event.save
      redirect_to event_path(@event_attendee.event)
      flash[:notice] = "El asistente ha sido eliminado."
    else
      redirect_to event_path(@event_attendee.event)
      flash[:alert] = "Algo no funcionó correctamente."
    end
  end

  private

  def event_attendee_params
    params.require(:event_attendee).permit(:seat, :attendee_id, :temperature)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_event_attendee
    @event_attendee = EventAttendee.find(params[:id])
  end
end
