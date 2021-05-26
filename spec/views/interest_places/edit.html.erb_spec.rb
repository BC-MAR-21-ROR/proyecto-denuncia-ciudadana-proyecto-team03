require 'rails_helper'

RSpec.describe "interest_places/edit", type: :view do
  fixtures :interest_places
  before(:each) do
    @interest_place = assign(:interest_place, interest_places(:one))
  end

  it "renders the edit interest_place form" do
    render

    assert_select "form[action=?][method=?]", interest_place_path(@interest_place), "post" do

      assert_select "input[name=?]", "interest_place[user_id]"

      assert_select "select[name=?]", "interest_place[postal_id]"

      assert_select "select[name=?]", "interest_place[settlement_id]"
    end
  end
end
