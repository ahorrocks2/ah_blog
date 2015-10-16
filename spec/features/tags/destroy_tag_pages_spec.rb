require 'rails_helper'

describe 'the process to destroy a tag' do
  it 'deletes a tag' do
    tag = Tag.create(description: 'TestTest')
    visit tag_path(tag)
    click_on 'Delete Tag'
    expect(page).to_not have_content('TestTest')
  end

end
