require "application_system_test_case"

class ParticipantsTest < ApplicationSystemTestCase
  setup do
    @participant = participants(:one)
  end

  test "visiting the index" do
    visit participants_url
    assert_selector "h1", text: "Participants"
  end

  test "creating a Participant" do
    visit participants_url
    click_on "New Participant"

    fill_in "Name", with: @participant.name
    fill_in "Task", with: @participant.task_id
    fill_in "Vote", with: @participant.vote
    click_on "Create Participant"

    assert_text "Participant was successfully created"
    click_on "Back"
  end

  test "updating a Participant" do
    visit participants_url
    click_on "Edit", match: :first

    fill_in "Name", with: @participant.name
    fill_in "Task", with: @participant.task_id
    fill_in "Vote", with: @participant.vote
    click_on "Update Participant"

    assert_text "Participant was successfully updated"
    click_on "Back"
  end

  test "destroying a Participant" do
    visit participants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Participant was successfully destroyed"
  end
end
