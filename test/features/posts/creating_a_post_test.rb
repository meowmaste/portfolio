require "test_helper"

feature "Creating A Post" do
  scenario "submit form data to create a new post" do
    sign_in
    #Given a completed new post form
    visit new_post_path
    fill_in "Title", with: "Luna"
    fill_in "Body", with: "...is a cool cat!"

    #When I submit the form
    click_on "Create Post"

    #Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.has_css? "#author"
    page.text.must_include users(:user1).email
  end
end
