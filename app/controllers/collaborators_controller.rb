class CollaboratorsController < ApplicationController
  before_action :set_collaborator, only: [:edit, :update, :destroy]

  def index
    @collaborators = Collaborator.all
  end

  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.new(collaborator_params)
    @collaborator.first_name = @collaborator.first_name.capitalize
    @collaborator.last_name = @collaborator.last_name.titleize
    @collaborator.rut = @collaborator.rut.upcase

    if @collaborator.save
      redirect_to collaborators_path
    else
      flash[:alert] = "Algo no funcionó correctamente."
      render :new
    end
  end

  def destroy
    @collaborator.destroy
    redirect_to collaborators_path
  end

  def edit
  end

  def update
    if @collaborator.update(collaborator_params)
      flash[:notice] = "El colaborador ha sido actualizado con éxito."
      redirect_to collaborators_path
    else
      flash[:alert] = "Algo no funcionó correctamente."
      render :edit
    end
  end

  private

  def set_collaborator
    @collaborator = Collaborator.find(params[:id])
    # authorize @event
  end

  def collaborator_params
    params.require(:collaborator).permit(:first_name, :last_name, :rut, :phone, :email, :pase)
  end
end
