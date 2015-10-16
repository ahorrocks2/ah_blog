require 'rails_helper'

describe 'the process to destroy a post' do
  it 'deletes a post' do
    post = Post.create(title: "Post to Destroy", content: "This will be deleted")
    visit post_path(post)
    click_on 'Delete Post'
    expect(page).to_not have_content 'Post to Destroy'
  end
end
