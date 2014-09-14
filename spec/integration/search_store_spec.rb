require 'spec_helper'

feature 'Search store for a term' do
  scenario 'searching by an item name' do
    visit root_path
    fill_in 'store_search', with: 'iPhone5s'
    click_button 'Search'
    expect(page).to have_css '.table'
    expect(page.all('.table tr').count).to be > 1
  end
end
