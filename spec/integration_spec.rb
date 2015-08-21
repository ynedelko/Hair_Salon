require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper')

describe('viewing all the stylists', {:type => :feature}) do
  it('allows a user to see all of the list that have been created') do
    visit('/')
    click_link('View All Stylists')
    expect(page).to have_content('stylists')
  end
end
