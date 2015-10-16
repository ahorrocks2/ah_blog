require 'rails_helper'

describe 'the path to edit a tag' do
  it 'edits a tag' do
    tag = Tag.create(description: 'TagTest')
    visit edit_tag_path(tag)
    fill_in 'Description', :with => 'Testing'
    click_on 'Submit'
    expect(page).to have_content 'Testing'
  end

  it 'gives an error when nothing is filled into the form' do
    tag = Tag.create(description: 'TagTest')
    visit edit_tag_path(tag)
    fill_in 'Description', :with => ''
    click_on 'Submit'
    expect(page).to have_content 'errors'
  end

end
