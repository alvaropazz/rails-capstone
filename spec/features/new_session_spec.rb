require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let!(:demo) { User.create(name: 'Test') }

  scenario 'Demo creates a new user' do
    visit '/login'

    fill_in 'name', with: 'Test'
    click_button 'Save'

    expect(page).to have_content('Test')
  end
end
