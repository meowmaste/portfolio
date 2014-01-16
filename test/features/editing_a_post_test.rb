require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to existing post" do
    #Given an existing post
    post = Post.create(tite: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit post_path(post)

    #When edit button is clicked and data is submitted
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    #Then the post will update
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"

  end
end
