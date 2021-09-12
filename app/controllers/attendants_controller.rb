class AttendantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_event, only: [:new, :create]

  def new
    @attendant = Attendant.new
  end

  def create
    if @event.quantity == 0
      redirect_to full_path
    else
      @attendant = Attendant.new(attendant_params)
      @attendant.event = @event

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

  private

  def attendant_params
    params.require(:attendant).permit(:first_name, :last_name, :rut, :phone, :email)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
