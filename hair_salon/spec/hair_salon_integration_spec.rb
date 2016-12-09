require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows the user to add a new stylist') do
    visit('/')
    fill_in('name', :with => 'Mandy')
    click_button('Add Stylist')
    expect(page).to have_content('Mandy')
  end
end
