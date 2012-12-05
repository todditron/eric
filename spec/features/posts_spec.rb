require 'spec_helper'

feature 'Posts' do
  scenario 'index' do
    first_post = create(:post, date: 1.days.ago, title: "First post", body: "<p class='first'>This is the body for the first post.</p>")
    second_post = create(:post, date: Date.today, title: "Second post", body: "<p class='second'>This is the body for the second post.</p>")

    visit posts_path

    # test title presence
    page.should have_content first_post.title
    page.should have_content second_post.title

    # test raw body presence
    page.should have_selector 'p.first'
    page.should have_selector 'p.second'

    # test order (newest first)
    page.text.should match /Second post.+First post/
  end

  scenario 'show' do
    post = create(:post)

    visit post_path(post)

    page.should have_content post.title
    page.should have_content post.body # TODO: only works if there isn't HTML in the body
  end
end