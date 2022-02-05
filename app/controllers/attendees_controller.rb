class AttendeesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_attendee, only: [:edit, :update, :destroy]

  def index
    @attendees = Attendee.all
  end

  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.new(attendee_params)
    @attendee.first_name = @attendee.first_name.capitalize
    @attendee.last_name = @attendee.last_name.titleize
    @attendee.rut = @attendee.rut.upcase

    if @attendee.save
      redirect_to attendees_path
    else
      flash[:alert] = "Algo no funcionó correctamente."
      render :new
    end
  end

  def destroy
    @attendee.destroy
    redirect_to attendees_path
  end

  def edit
  end

  def update
    if @attendee.update(attendee_params)
      flash[:notice] = "El asistente ha sido actualizado con éxito."
      redirect_to attendees_path
    else
      flash[:alert] = "Algo no funcionó correctamente."
      render :edit
    end
  end

  private

  def set_attendee
    @attendee = Attendee.find(params[:id])
    # authorize @event
  end

  def attendee_params
    params.require(:attendee).permit(:first_name, :last_name, :rut, :phone, :email, :pase)
  end
end
