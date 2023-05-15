require "application_system_test_case"

class AnimalsTest < ApplicationSystemTestCase
  setup do
    @animal = animals(:one)
  end

  test "visiting the index" do
    visit animals_url
    assert_selector "h1", text: "Animals"
  end

  test "should create animal" do
    visit animals_url
    click_on "New animal"

    fill_in "Food", with: @animal.food
    fill_in "Nextvaccine", with: @animal.nextvaccine
    fill_in "Notes", with: @animal.notes
    fill_in "Petname", with: @animal.petname
    fill_in "Ppname", with: @animal.ppname
    fill_in "Species", with: @animal.species
    fill_in "User", with: @animal.user_id
    fill_in "Vaccineapplied", with: @animal.vaccineapplied
    fill_in "Venue", with: @animal.venue_id
    click_on "Create Animal"

    assert_text "Animal was successfully created"
    click_on "Back"
  end

  test "should update Animal" do
    visit animal_url(@animal)
    click_on "Edit this animal", match: :first

    fill_in "Food", with: @animal.food
    fill_in "Nextvaccine", with: @animal.nextvaccine
    fill_in "Notes", with: @animal.notes
    fill_in "Petname", with: @animal.petname
    fill_in "Ppname", with: @animal.ppname
    fill_in "Species", with: @animal.species
    fill_in "User", with: @animal.user_id
    fill_in "Vaccineapplied", with: @animal.vaccineapplied
    fill_in "Venue", with: @animal.venue_id
    click_on "Update Animal"

    assert_text "Animal was successfully updated"
    click_on "Back"
  end

  test "should destroy Animal" do
    visit animal_url(@animal)
    click_on "Destroy this animal", match: :first

    assert_text "Animal was successfully destroyed"
  end
end
