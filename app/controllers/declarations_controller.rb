class DeclarationsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_declaration, only: [:show, :ready]
  before_action :find_attendant, only: :create
  before_action :find_event, only: [:new, :create]

  def new
    @declaration = Declaration.new
  end

  def create
    @declaration = Declaration.new(declaration_params)
    @declaration.event = @event
    @declaration.attendant = @attendant

      if @declaration.save
        redirect_to "/ready/#{@declaration.id}"
      else
        flash[:alert] = "Algo no funcionó correctamente."
        render :new
      end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Declaración Jurada #{@declaration.event} - #{@declaration.attendant}",
        page_size: 'Letter',
        template: "declarations/show.html.erb",
        layout: "pdf.html",
        orientation: "Portrait",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  def ready

  end
  private

  def set_declaration
    @declaration = Declaration.find(params[:id])
    # authorize @declaration
  end

  def set_declaration_ready
    @declaration = Declaration.find(declaration_params)
  end

  def declaration_params
    params.require(:declaration).permit(:rut, :qa, :qb, :qc, :qd1, :qd2, :qd3, :qe1, :qe2, :qe3, :qe4, :qe5, :qe6, :qe7, :qe8)
  end

  def find_attendant
    rut = params[:declaration][:rut]
    @attendant = Attendant.find_by(rut: rut.upcase)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
