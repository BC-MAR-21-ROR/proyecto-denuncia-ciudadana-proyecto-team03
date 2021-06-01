class CommentsController < ApplicationController
  before_action :set_complaint

  def create
    @comment = @complaint.comments.build(comment_params)
    @comment.save

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.js
    end
  end

  def set_complaint
    @complaint = Complaint.find(params[:complaint_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :anonymous).merge(user_id: current_user.id)
  end
end
