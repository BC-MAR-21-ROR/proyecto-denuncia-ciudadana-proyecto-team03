class ComplaintsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_complaint, only: %i[ show edit update destroy ]
  include Pagy::Backend

  # GET /complaints or /complaints.json
  def index
    @page_title = 'Proyecto denuncia ciudadana'
    @pagy, @complaints = pagy(Complaint.all.order('created_at DESC'), page: params[:page])

    ## Filters
    @q = Complaint.includes(:user, :category, :state, :municipality, :postal, :settlement).ransack(params[:q])
    @pagy, @complaints = pagy(@q.result.all.order('created_at DESC'), page: params[:page])
  end

  # GET /complaints/1 or /complaints/1.json
  def show
  end

  def showMyComplaints
    @page_title = 'Proyecto denuncia ciudadana'
    @pagy, @complaints = pagy(Complaint.where(user: current_user).order('created_at DESC'), page: params[:page])

    ## Filters
    @q = Complaint.ransack(params[:q])
    @pagy, @complaints = pagy(@q.result.where(user: current_user).order('created_at DESC'), page: params[:page])
  end

  # GET /complaints/new
  def new
    @complaint = current_user.complaints.build
  end

  # GET /complaints/1/edit
  def edit
  end

  # POST /complaints or /complaints.json
  def create
    @complaint = current_user.complaints.build(complaint_params)

    respond_to do |format|
      if @complaint.save
        format.html { redirect_to @complaint, notice: "Complaint was successfully created." }
        format.json { render :show, status: :created, location: @complaint }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complaints/1 or /complaints/1.json
  def update
    @user = Complaint.where(user: current_user, id: params[:id]).count
    if @user > 0 || current_user.is_admin?
      respond_to do |format|
        if @complaint.update(complaint_params)
          format.html { redirect_to @complaint, notice: "Complaint was successfully updated." }
          format.json { render :show, status: :ok, location: @complaint }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @complaint.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @complaint, notice: "This complaint does not belong to you." }
        format.json { render :show, status: :ok, location: @complaint }
      end
    end
  end

  # DELETE /complaints/1 or /complaints/1.json
  def destroy
    @user = Complaint.where(user: current_user, id: params[:id]).count
    if @user > 0 || current_user.is_admin?
      @complaint.destroy
      respond_to do |format|
        format.html { redirect_to complaints_url, notice: "Complaint was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to complaints_url, notice: "This complaint does not belong to you." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def complaint_params
      params.require(:complaint).permit(:title, :description, :category_id, :date_of_events, :state_id, :municipality_id, :postal_id, :settlement_id, :street, :number, :anonymous, evidences: [])
    end
end
