require 'rails_helper'

RSpec.describe "interest_places/new", type: :view do
  fixtures :interest_places
  before(:each) do
    assign(:interest_place, InterestPlace.new)
  end

  it "renders new interest_place form" do
    render

    assert_select "form[action=?][method=?]", interest_places_path, "post" do

      assert_select "input[name=?]", "interest_place[user_id]"

      assert_select "select[name=?]", "interest_place[postal_id]"

      assert_select "select[name=?]", "interest_place[settlement_id]"
    end
  end
end
