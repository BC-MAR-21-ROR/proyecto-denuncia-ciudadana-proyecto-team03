require "application_system_test_case"

class ComplaintsTest < ApplicationSystemTestCase
  setup do
    @complaint = complaints(:one)
  end

  test "visiting the index" do
    visit complaints_url
    assert_selector "h1", text: "Complaints"
  end

  test "creating a Complaint" do
    visit complaints_url
    click_on "New Complaint"

    fill_in "Category", with: @complaint.category_id
    fill_in "Date of events", with: @complaint.date_of_events
    fill_in "Description", with: @complaint.description
    fill_in "Municipality", with: @complaint.municipality_id
    fill_in "Number", with: @complaint.number
    fill_in "Postal", with: @complaint.postal_id
    fill_in "Settlement", with: @complaint.settlement_id
    fill_in "State", with: @complaint.state_id
    fill_in "Street", with: @complaint.street
    fill_in "Title", with: @complaint.title
    click_on "Create Complaint"

    assert_text "Complaint was successfully created"
    click_on "Back"
  end

  test "updating a Complaint" do
    visit complaints_url
    click_on "Edit", match: :first

    fill_in "Category", with: @complaint.category_id
    fill_in "Date of events", with: @complaint.date_of_events
    fill_in "Description", with: @complaint.description
    fill_in "Municipality", with: @complaint.municipality_id
    fill_in "Number", with: @complaint.number
    fill_in "Postal", with: @complaint.postal_id
    fill_in "Settlement", with: @complaint.settlement_id
    fill_in "State", with: @complaint.state_id
    fill_in "Street", with: @complaint.street
    fill_in "Title", with: @complaint.title
    click_on "Update Complaint"

    assert_text "Complaint was successfully updated"
    click_on "Back"
  end

  test "destroying a Complaint" do
    visit complaints_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Complaint was successfully destroyed"
  end
end
