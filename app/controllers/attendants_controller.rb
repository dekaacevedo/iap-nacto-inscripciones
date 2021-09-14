class AttendantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_attendant, only: :destroy
  before_action :find_event, only: [:new, :create]

  def new
    @attendant = Attendant.new
  end

  def create
    if @event.quantity == 0
      redirect_to full_path
    else
      @attendant = Attendant.new(attendant_params)
      @attendant.first_name = @attendant.first_name.capitalize
      @attendant.last_name = @attendant.last_name.titleize
      @attendant.rut = @attendant.rut.upcase
      @attendant.event = @event
      @attendant.seat = @event.seats.shift

      if @attendant.save
        @event.quantity = @event.quantity - 1
        @event.save
        redirect_to success_path
      else
        flash[:alert] = "Algo no funcionó correctamente."
        render :new
      end
    end
  end

  def destroy
    if @attendant.destroy
      redirect_to event_path(@attendant.event)
      flash[:notice] = "El asistente ha sido eliminado."
    else
      redirect_to event_path(@event)
      flash[:alert] = "Algo no funcionó correctamente."
    end
  end

  private

  def attendant_params
    params.require(:attendant).permit(:first_name, :last_name, :rut, :phone, :email, :seat, :pase)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def set_attendant
    @attendant = Attendant.find(params[:id])
    # authorize @attendant
  end
end
