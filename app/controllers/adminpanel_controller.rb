# Administration Panel
# frozen_string_literal: false

# Administration user and administration panel
class AdminpanelController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin?, only: %i[index show edit update destroy]
  before_action :set_users, only: %i[edit update destroy]

  def index
    @adminpanel = User.all
  end

  def edit; end

  def show; end

  def destroy
    @adminpanel.destroy
    respond_to do |format|
      format.html { redirect_to adminpanel_path, notice: 'Complaint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @adminpanel.update(users_params)
        format.html { redirect_to adminpanel_index_path, notice: 'users was successfully updated.' }
        format.json { render :index, status: :ok, location: @adminpanel }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @adminpanel.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_users
    @adminpanel = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:username, :user_type)
  end
end
