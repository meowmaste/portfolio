require "test_helper"

feature "Check For Zurb" do
  scenario "check to see if zurb is implemented" do
    #Given 

    #When 
    visit root_path

    #Then
    page.source.must_include("foundation_and_overrides.css")

  end
end
