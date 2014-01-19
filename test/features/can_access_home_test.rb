require "test_helper"

feature "Can Access Home" do
  scenario "the test is sound" do
    # visit root_path
    visit "/"
    page.must_have_content "Hello"
  end
end
