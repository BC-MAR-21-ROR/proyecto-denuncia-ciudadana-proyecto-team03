require "rails_helper"

RSpec.describe InterestPlacesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/interest_places").to route_to("interest_places#index")
    end

    it "routes to #new" do
      expect(get: "/interest_places/new").to route_to("interest_places#new")
    end

    it "routes to #show" do
      expect(get: "/interest_places/1").to route_to("interest_places#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/interest_places/1/edit").to route_to("interest_places#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/interest_places").to route_to("interest_places#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/interest_places/1").to route_to("interest_places#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/interest_places/1").to route_to("interest_places#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/interest_places/1").to route_to("interest_places#destroy", id: "1")
    end
  end
end
