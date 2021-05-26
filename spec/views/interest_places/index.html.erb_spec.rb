require 'rails_helper'

RSpec.describe "interest_places/index", type: :view do
  fixtures :interest_places
  before(:each) do
    assign(:interest_places, [interest_places(:one), interest_places(:two)])
  end

  it "renders a list of interest_places" do
    render
    assert_select "tr>td", text: 43207.to_s, count: 1
    assert_select "tr>td", text: 45623.to_s, count: 1
    assert_select "tr>td", text: 'Benito Juarez'.to_s, count: 1
    assert_select "tr>td", text: 'Emiliano Zapata'.to_s, count: 1
  end
end
