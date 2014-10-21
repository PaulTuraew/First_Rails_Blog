require 'rails_helper'

feature "Manage Posts" do

def create_post
  Post.create!(#capybara creates a test database it should clear out when test runs
  subject: 'this is my subject',
  body: 'blah blah blogy blog',
  published_at: '2014-10-21'
  )
end

  scenario "See list of blog posts" do
    create_post
    visit posts_path
    expect(page).to have_content("this is my subject")
  end

  scenario "User can click the create new button and be directed to a new page with a form" do
    create_post
    visit posts_path
    click_on('Create New Post')
    visit new_post_path
  end

end

#   scenario "List all Posts" do
#     create_posts

#     visit posts_path

#     expect(page.find('.subject')).to have_content(/Test Post/)
#     expect(page.find('.body')).to have_content(/Test Post/)
#     expect(page.find('.published_at')).to have_content(/Test Post/)
# end
# scenario "Edit Posts"
# end

# scenario "Delete post and redirect to index" do
#   post = create_post

#   cisit post_path(post)
#   click_on 'Destroy'

#   expect(current_path).to eq(posts_path)
#   expect(posts_path).to_not have_content("blah")
# end


