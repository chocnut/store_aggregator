require 'spec_helper'

feature 'View the homepage' do
  scenario 'check about the application' do
    visit root_path
    expect(page).to have_title 'Store Aggregator'
  end

  scenario 'check if search form is visible' do
    visit root_path
    expect(page).to have_css '.form-horizontal'
  end
end
