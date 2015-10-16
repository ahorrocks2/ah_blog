require 'rails_helper'

describe 'the process to add a tag' do
  it 'add a tag' do
    post = Post.create(title: "Post", content: "Content")
    visit post_path(post)
    click_link 'Add a Tag'
    fill_in 'Description', :with => 'Tag1'
    click_on 'Submit'
    expect(page).to have_content 'Tag1'
  end

  it 'gives an error when nothing is filled in' do
    post = Post.create(title: "Post", content: "Content")
    visit post_path(post)
    click_link 'Add a Tag'
    fill_in 'Description', :with => ''
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end
