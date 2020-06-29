require 'rails_helper'

RSpec.describe 'Project Tracker', type: :system do
  context 'While visiting the home page as a new user' do
    it "page contains 'Project Tracker'" do
      visit root_path
      expect(page).to have_content('Project Tracker')
    end
  end
end
