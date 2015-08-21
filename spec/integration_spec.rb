require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper')

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to view a list of stylists') do
    visit('/')
    click_link('View Stylist')
    expect(page).to have_content('Stylists')
  end
end
