class BootcampsController < ApplicationController
  before_action :set_bootcamp, only: %i[ show edit update destroy ]

  # GET /bootcamps or /bootcamps.json
  def index
    @bootcamps = Bootcamp.all
    if params[:search].to_s != ''
      @bootcamps = Bootcamp.where("name LIKE '%#{params[:search]}%'")
    else
      @bootcamps = Bootcamp.all
    end
  end

  # GET /bootcamps/1 or /bootcamps/1.json
  def show
  end

  # GET /bootcamps/new
  def new
    @bootcamp = Bootcamp.new
  end

  # GET /bootcamps/1/edit
  def edit
  end

  # POST /bootcamps or /bootcamps.json
  def create
    @bootcamp = Bootcamp.new(bootcamp_params)

    respond_to do |format|
      if @bootcamp.save
        format.html { redirect_to bootcamp_url(@bootcamp), notice: "Bootcamp was successfully created." }
        format.json { render :show, status: :created, location: @bootcamp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bootcamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bootcamps/1 or /bootcamps/1.json
  def update
    respond_to do |format|
      if @bootcamp.update(bootcamp_params)
        format.html { redirect_to bootcamp_url(@bootcamp), notice: "Bootcamp was successfully updated." }
        format.json { render :show, status: :ok, location: @bootcamp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bootcamp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bootcamps/1 or /bootcamps/1.json
  def destroy
    @bootcamp.destroy

    respond_to do |format|
      format.html { redirect_to bootcamps_url, notice: "Bootcamp was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bootcamp
      @bootcamp = Bootcamp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bootcamp_params
      params.require(:bootcamp).permit(:name, :description, :dates)
    end
end
