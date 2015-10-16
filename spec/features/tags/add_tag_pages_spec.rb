require 'rails_helper'

describe 'the process to add a tag' do
  it 'add a tag' do
    visit posts_path
    click_link 'New Tag'
    fill_in 'Description', :with => 'Tag1'
    click_on 'Submit'
    expect(page).to have_content 'Tag1'
  end

  it 'gives an error when nothing is filled in' do
    visit new_tag_path
    fill_in 'Description', :with => ''
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end
end
