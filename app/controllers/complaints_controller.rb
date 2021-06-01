class ComplaintsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_complaint, only: %i[ show edit update destroy ]
  include Pagy::Backend

  # GET /complaints or /complaints.json
  def index
    @page_title = 'Proyecto denuncia ciudadana'
    @pagy, @complaints = pagy(Complaint.all.order('created_at DESC'), page: params[:page])

    ## Filters
    @q = Complaint.ransack(params[:q])
    @pagy, @complaints = pagy(@q.result.all.order('created_at DESC'), page: params[:page])
  end

  # GET /complaints/1 or /complaints/1.json
  def show
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
    respond_to do |format|
      if @complaint.update(complaint_params)
        format.html { redirect_to @complaint, notice: "Complaint was successfully updated." }
        format.json { render :show, status: :ok, location: @complaint }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1 or /complaints/1.json
  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html { redirect_to complaints_url, notice: "Complaint was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def complaint_params
      params.require(:complaint).permit(:title, :description, :category_id, :date_of_events, :state_id, :municipality_id, :postal_id, :settlement_id, :street, :number)
    end
end
