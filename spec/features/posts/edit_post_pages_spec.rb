require 'rails_helper'

describe 'the edit a post process' do
  it 'edits a post' do
    post = Post.create(title: 'Test Post', content: 'This is a test post.')
    visit edit_post_path(post)
    fill_in 'Title', :with => 'Testing Testing'
    fill_in 'Content', :with => 'I am testing fa la la la la.'
    click_on 'Update Post'
    expect(page).to have_content 'Testing Testing'
  end

  it 'shows an error when nothing is filled in' do
    post = Post.create(title: 'Test Post', content: 'This is a test post.')
    visit edit_post_path(post)
    fill_in 'Title', :with => ''
    fill_in 'Content', :with => ''
    click_on 'Update Post'
    expect(page).to have_content 'errors'
  end

end
