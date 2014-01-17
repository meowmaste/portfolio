require "test_helper"

feature "Check For Zurb" do
  scenario "check to see if zurb is implemented" do
    #Given 

    #When 
    visit root_path

    #Then
    puts page.body
    page.body.must_include "columns"

  end
end
