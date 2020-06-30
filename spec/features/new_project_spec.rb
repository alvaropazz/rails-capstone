require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let!(:demo) { User.create(name: 'Test') }

  scenario 'Demo user creates a new project' do
    visit '/login'

    fill_in 'name', with: 'Test'
    click_button 'Save'

    visit '/projects/new'

    fill_in 'project_name', with: 'Project 1'
    fill_in 'project_amount', with: '1'

    click_button 'Save'

    visit '/projects/external'

    expect(page).to have_content('Project 1')
  end
end
