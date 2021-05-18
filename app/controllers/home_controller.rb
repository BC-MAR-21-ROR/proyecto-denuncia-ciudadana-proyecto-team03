# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    my_interested_settlements = current_user.interest_places.pluck(:settlement_id)
    @complaints = Complaint.where(settlement_id: my_interested_settlements).order('created_at DESC')
  end
end
