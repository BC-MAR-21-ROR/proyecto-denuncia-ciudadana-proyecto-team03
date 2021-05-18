class InterestPlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_interest_place, only: %i[ show edit update destroy ]

  # GET /interest_places or /interest_places.json
  def index
    @interest_places = current_user.interest_places.includes(:zip, :settlement)
  end

  # GET /interest_places/1 or /interest_places/1.json
  def show
  end

  # GET /interest_places/new
  def new
    @interest_place = InterestPlace.new(user: current_user)
  end

  # GET /interest_places/1/edit
  def edit
  end

  # POST /interest_places or /interest_places.json
  def create
    @interest_place = InterestPlace.new(interest_place_params)

    respond_to do |format|
      if @interest_place.save
        format.html { redirect_to interest_places_path, notice: "Interest place was successfully created." }
        format.json { render :show, status: :created, location: @interest_place }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interest_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interest_places/1 or /interest_places/1.json
  def update
    respond_to do |format|
      if @interest_place.update(interest_place_params)
        format.html { redirect_to interest_places_path, notice: "Interest place was successfully updated." }
        format.json { render :show, status: :ok, location: @interest_place }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interest_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interest_places/1 or /interest_places/1.json
  def destroy
    @interest_place.destroy
    respond_to do |format|
      format.html { redirect_to interest_places_url, notice: "Interest place was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest_place
      @interest_place = InterestPlace.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interest_place_params
      params.require(:interest_place).permit(:user_id, :zip_id, :settlement_id)
    end
end
