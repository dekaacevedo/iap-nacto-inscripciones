class AttendantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_attendant, only: [:destroy, :edit, :update]
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
        regex = /\A[\w|.|-]+@[\w|-]+\.\w+\z/
        if regex.match?(@attendant.email)
          mail = AttendantMailer.with(attendant: @attendant).info
          mail.deliver_now
        else
          mail = AttendantMailer.with(attendant: @attendant).info_without_email
          mail.deliver_now
        end
        redirect_to success_path
      else
        flash[:alert] = "Algo no funcionó correctamente."
        render :new
      end
    end
  end

  def edit

  end

  def update
    if @attendant.update(attendant_params)
      redirect_to event_path(@attendant.event)
      flash[:notice] = "El asistente ha sido actualizado con éxito."
    else
      flash[:alert] = "Algo no funcionó correctamente."
      render :edit
    end
  end

  def destroy
    if @attendant.destroy
      @event = @attendant.event
      @event.quantity = @event.quantity + 1
      @event.save
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
