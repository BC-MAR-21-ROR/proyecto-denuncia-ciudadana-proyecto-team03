require 'rails_helper'

RSpec.describe "interest_places/show", type: :view do
  fixtures :postals
  fixtures :settlements
  fixtures :interest_places
  before(:each) do
    @interest_place = assign(:interest_place, interest_places(:one))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Benito Juarez/)
    expect(rendered).to match(/43207/)
  end
end
