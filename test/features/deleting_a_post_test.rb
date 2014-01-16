require "test_helper"

feature "Deleting A Post" do
  scenario "post is deleted when button is pressed" do
    #Given an existing post
    Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit posts_path

    #When delete button is clicked
    click_on "Destroy"

    #Then the post is deleted
    page.wont_have_content "Becoming a Code Fellow"

  end
end
