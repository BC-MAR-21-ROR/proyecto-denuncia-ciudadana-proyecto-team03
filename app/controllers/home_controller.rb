# frozen_string_literal: true
class HomeController < ApplicationController
  layout :layout_application, only: [:index]
  before_action :authenticate_user!, except: %i[welcome]
  def welcome
    @page_title = 'Proyecto denuncia ciudadana'
  end
  def index
    @page_title = 'Proyecto denuncia ciudadana'
    my_interested_settlements = current_user.interest_places.pluck(:settlement_id)
    @complaints = Complaint.where(settlement_id: my_interested_settlements).order('created_at DESC')
  end
  protected
    def layout_application
      "application"
    end
end
