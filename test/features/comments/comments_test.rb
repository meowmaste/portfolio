require "test_helper"

feature "creating and approving comments to blog posts" do
  scenario "As a site visitor I want to write a comment from a blog post page so that I can troll the author" do
  	visit posts_path(posts(:http))
  	fill_in "Comment" with: "What a cool post!"
  	click_on "Save Comment"
  	page.text.must_include "Your comment is waiting for approval."
  end

  scenario "As an author or editor I want to approve comments so that my blog does not have spam comments" do
  	sign_in(:author)
  	visit posts_path(posts(:http))
  	click_on "Approve Comment"
  	page.text.must_include "The comment has been saved"
  end 

end