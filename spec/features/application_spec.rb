require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Homepage' do
  scenario 'Shows the welcome message' do
    visit '/'

    expect(page).to have_content 'Welcome!'
  end

  scenario 'User can add and view a computer' do

    visit '/'

    click_on "Add a Computer"

    fill_in "brand", with: "Mac"
    fill_in "color", with: "White"
    fill_in "size", with: "13"
    fill_in "ram", with: "4"

    click_on "Add Computer"

    expect(page).to have_content"Mac"
    expect(page).to have_content"White"
    expect(page).to have_content"13"
    expect(page).to have_content"4"

  end
end