class StatesController < ApplicationController
    before_action :set_state, only: %i[ show ]
  
    # GET /states/1 or /states/1.json
    def show
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end
end