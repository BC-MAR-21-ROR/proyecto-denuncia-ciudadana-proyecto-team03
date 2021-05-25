class ZipsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_zip, only: %i[ show ]
  
    # GET /zips/1 or /zips/1.json
    def show
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_zip
      @zip = Zip.find(params[:id])
    end
end