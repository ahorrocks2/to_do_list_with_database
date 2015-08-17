require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the to do list path',{:type =>:feature}) do
  it ('takes a task and adds it to the to do list') do
    visit('/')
    fill_in('description', :with => "walk the dog")
    click_button('Add task!')
    expect(page).to have_content("walk the dog")
  end
end
