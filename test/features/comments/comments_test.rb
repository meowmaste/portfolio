require "test_helper"

feature "creating and approving comments to blog posts" do
  scenario "As a site visitor I want to write a comment from a blog post page so that I can troll the author" do
    visit post_path(posts(:http))
  	fill_in "Content", with: "What a cool post!"
  	click_on "Create Comment"
  	page.text.must_include "Comment was successfully created"
  end

  scenario "As an author or editor I want to approve comments so that my blog does not have spam comments" do
  	sign_in(:author)
  	visit post_path(posts(:http))
    fill_in "Content", with: "What a cool post!"
    click_on "Create Comment"
  	click_on "Approve"
  	page.text.must_include "Comment approved."
  end 

end