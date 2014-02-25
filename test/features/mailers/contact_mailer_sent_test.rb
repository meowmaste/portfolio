require "test_helper"

feature "Form from Contact Sent" do
  scenario "submit form data from contact page and sent" do
    visit contact_path
    fill_in "Name", with: "Devin"
    fill_in "Email", with: "Devin@example.com"
    fill_in "Subject", with: "Stuff"
    fill_in "Body", with: "Make me a site!"

    click_on "Send"

    page.text.must_include "Message was sent"
  end

end 