# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'create a new user, signup' do
    scenario 'Valid sign up' do
      DatabaseCleaner.clean
      visit signup_path
      within('form') do
        fill_in 'Username', with: 'Qoosim'
        fill_in 'Email', with: 'qoosim@gmail.com'
        fill_in 'Password', with: 'password'
        fill_in 'Confirmation', with: 'password'
      end
      click_button 'Sign up'
      expect(page).to have_content('Welcome Qoosim')
    end

    scenario 'Invalid sign up' do
      visit signup_path
      within('form') do
        fill_in 'Username', with: 'Qoosim'
        fill_in 'Email', with: 'qoosim@gmail.com'
        fill_in 'Password', with: 'password'
        fill_in 'Confirmation', with: 'apassword'
      end
      click_button 'Sign up'
      expect(page).to have_content("Password confirmation doesn't match")
    end
  end
end
