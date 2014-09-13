require 'spec_helper'

feature 'Search store for a term' do
  scenario 'searching by an item name' do
    visit root_path
    fill_in 'Search', with: 'iPhone5s'
    click_button 'Search'
    expect(page).to have_css 'li.item', count: 15
  end
end
