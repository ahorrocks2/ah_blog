require 'rails_helper'

describe 'the process to destroy a tag' do
  it 'deletes a tag' do
    post = Post.create(title: 'Post', content: 'text')
    visit post_path(post)
    click_link 'Add a Tag'
    fill_in 'Description', :with => 'TestTest'
    click_on 'Submit'
    click_link '[X]'
    expect(page).to_not have_content('TestTest')
  end

end
