require "test_helper"

feature "Deleting A Post" do
  scenario "post is deleted when button is pressed" do
    sign_in(:editor)
    #Given an existing post
	  visit posts_path
    title = posts(:postgres).title

    #When delete button is clicked
    first(:link, "Destroy").click

    #Then the post is deleted
    page.wont_have_content title
  end

  scenario "as an author, I should not be able to delete posts to give the editor publishing power" do
    sign_in(:author)
    visit posts_path 
    page.wont_have_content "Destroy"
  end 

  scenario "as a visitor, I should not be able to delete posts" do
    visit posts_path 
    page.wont_have_content "Destroy"
  end 

end
