require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('spec_helper')

describe('viewing all the stylists', {:type => :feature}) do
  it('allows a user to see all of the stylists that have been added') do
    visit('/')
    click_link('View All Stylists')
    expect(page).to have_content('stylists')
  end
end

describe('viewing all the clients', {:type => :feature}) do
  it('allows a user to see all of the clients that have been created') do
    visit('/')
    click_link('View All Clients')
    expect(page).to have_content('clients')
  end
end

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to add a stylist') do
    visit('/')
    click_link('Add a New Stylist')
    fill_in('name', :with =>'Bob')
    click_button('Add Stylist')
    expect(page).to have_content('Thanks')
  end
end

describe('adding a new client', {:type => :feature}) do
  it('allows a user to add a client') do
    visit('/')
    click_link('Add a New Client')
    fill_in('name', :with =>'Sue')
    click_button('Add Client')
    expect(page).to have_content('Thanks')
  end
end
