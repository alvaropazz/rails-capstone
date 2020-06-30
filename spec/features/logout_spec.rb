require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let!(:demo) { User.create(name: 'Test') }

  scenario 'Demo logout' do
    visit '/login'

    fill_in 'name', with: 'Test'
    click_button 'Save'

    visit '/logout'

    expect(page).to have_content('Login')
  end
end
