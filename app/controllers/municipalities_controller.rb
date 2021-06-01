class MunicipalitiesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_municipality, only: %i[ show ]
  
    # GET /municipalities/1 or /municipalities/1.json
    def show
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_municipality
      @municipality = Municipality.find(params[:id])
    end
end