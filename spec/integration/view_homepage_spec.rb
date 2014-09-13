require 'spec_helper'

feature 'View the homepage' do
  scenario 'check about the application' do
    visit root_path
    expect(page).to have_title 'Store Aggregator'
    expect(page).to have_css '[data-role="description"]'
  end
end
