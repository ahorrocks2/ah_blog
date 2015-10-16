require 'rails_helper'

describe 'the add a post process' do
  it 'adds a new post' do
    visit posts_path
    click_link "New Post"
    fill_in "Title", :with => "Test Post"
    fill_in "Content", :with => "So much content."
    click_on 'Submit'
    expect(page).to have_content 'Post'
  end

  it 'gives errors when nothing is filled in' do
    visit new_post_path
    fill_in 'Title', :with => ''
    fill_in 'Content', :with => ''
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end

end
