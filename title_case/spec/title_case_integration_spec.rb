require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the title case path', {:type => :feature}) do
  it('processes the user entry and returns it title cased') do
    visit('/')
    fill_in('title', :with => 'green eggs and ham')
    click_button('Send')
    expect(page).to have_content('Green Eggs And Ham')
  end

  it('does not modify non-letter input') do
    visit('/')
    fill_in('title', :with => '123 123 @this')
    click_button('Send')
    expect(page).to have_content('123 123 @this')
  end

  it('empty string input returns an empty string and does not fail') do
    visit('/')
    fill_in('title', :with => '')
    click_button('Send')
    expect(page).to have_content('')
  end

end
