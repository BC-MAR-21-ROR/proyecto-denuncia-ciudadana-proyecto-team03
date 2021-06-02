class LikesController < ApplicationController
  before_action :set_complaint

  def create
    @complaint.liked_by current_user
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @complaint.unliked_by current_user
    respond_to do |format|
      format.js
    end
  end

  private

  def set_complaint
    @complaint = Complaint.find(params[:id])
  end
end
