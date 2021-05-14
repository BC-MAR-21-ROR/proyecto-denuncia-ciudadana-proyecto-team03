json.extract! complaint, :id, :title, :description, :category_id, :date_of_events, :state_id, :municipality_id, :zip_id, :settlement_id, :street, :number, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)
