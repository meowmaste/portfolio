require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to existing post" do
    sign_in
    #Given an existing post
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.", author_id: users(:user1).id)
    visit post_path(post)
    #When edit button is clicked and data is submitted
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"
    #Then the post will update
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end

  scenario "as an author, I want to be able to update posts to fix typos" do
    sign_in(:author)
    visit edit_post_path(posts(:http))
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
    page.wont_have_content "HTTP"
  end 

  scenario "as an editor, I want to be able to update posts to fix typos" do
    sign_in(:editor)
    visit edit_post_path(posts(:http))
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
    page.wont_have_content "HTTP"
  end

  scenario "as a vistor, I should not be able to update posts" do
    visit edit_post_path(posts(:http))
    page.text.must_include "You need to sign in"
  end 
end
