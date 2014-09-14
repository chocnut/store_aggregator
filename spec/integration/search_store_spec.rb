require 'spec_helper'

feature 'Search store for a term' do
  scenario 'searching by an item name' do
    visit root_path
    fill_in 'store_search', with: 'iPhone5s'
    click_button 'Search'
    expect(page).to have_css '.table'
    expect(page.all('.table tr').count).to be > 1
  end

  scenario 'pagination to an existing search results' do
    visit search_path(id: 'iPhone5s', page:2)
    first('.next a').click
    expect(first('li.active span').text).to eq '3'
  end

end
