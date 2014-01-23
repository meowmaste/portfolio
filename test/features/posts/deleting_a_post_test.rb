require "test_helper"

feature "Deleting A Post" do
  scenario "post is deleted when button is pressed" do
    sign_in
    #Given an existing post
	visit posts_path
    title = posts(:http).title

    #When delete button is clicked
    first(:link, "Destroy").click

    #Then the post is deleted
    page.wont_have_content title

  end
end
