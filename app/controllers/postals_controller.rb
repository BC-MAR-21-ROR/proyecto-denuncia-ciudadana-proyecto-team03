class PostalsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_postal, only: %i[ show ]
  
    # GET /postals/1 or /postals/1.json
    def show
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_postal
      @postal = Postal.find(params[:id])
    end
end