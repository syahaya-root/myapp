require "application_system_test_case"

class BootcampsTest < ApplicationSystemTestCase
  setup do
    @bootcamp = bootcamps(:one)
  end

  test "visiting the index" do
    visit bootcamps_url
    assert_selector "h1", text: "Bootcamps"
  end

  test "should create bootcamp" do
    visit bootcamps_url
    click_on "New bootcamp"

    fill_in "Dates", with: @bootcamp.dates
    fill_in "Description", with: @bootcamp.description
    fill_in "Name", with: @bootcamp.name
    click_on "Create Bootcamp"

    assert_text "Bootcamp was successfully created"
    click_on "Back"
  end

  test "should update Bootcamp" do
    visit bootcamp_url(@bootcamp)
    click_on "Edit this bootcamp", match: :first

    fill_in "Dates", with: @bootcamp.dates
    fill_in "Description", with: @bootcamp.description
    fill_in "Name", with: @bootcamp.name
    click_on "Update Bootcamp"

    assert_text "Bootcamp was successfully updated"
    click_on "Back"
  end

  test "should destroy Bootcamp" do
    visit bootcamp_url(@bootcamp)
    click_on "Destroy this bootcamp", match: :first

    assert_text "Bootcamp was successfully destroyed"
  end
end
