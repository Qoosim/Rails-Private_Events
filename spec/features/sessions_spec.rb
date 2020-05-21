# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User sign in', type: :feature do
  # subject do
  #   User.new(username: 'name', email: 'name@gmail.com', password: 'password', password_confirmation: 'password')
  # end

  # let!('user') { User.new(username: 'name', email: 'name@gmail.com', password: 'password', password_confirmation: 'password')}
  # describe 'create' do
  #   it 'create a new user object when the input is valid' do
  #     expect(user).to be_a_new(User)
  #   end
  # end
  # before { subject.save }

  describe 'should log in to the app:' do
    # before(:each) do
    #   @user = User.create!(username: 'test1', email: 'test1@gmail.com', password: 'password', password_confirmation: 'password')
    #   # @user.save
    # end
    scenario 'Valid user login' do
      signup
      visit login_path
      within('form') do
        fill_in 'Email', with: 'qoosim@gmail.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      visit profile_path(@user)
      sleep(10)
      expect(page).to have_current_path(profile_path(@user))
    end

    def signup
      visit signup_path
      within('form') do
        fill_in 'Username', with: 'Qoosim'
        fill_in 'Email', with: 'qoosim@gmail.com'
        fill_in 'Password', with: 'password'
        fill_in 'Confirmation', with: 'password'
      end
      click_button 'Sign up'
    end

    # scenario 'Invalid user login' do
    #   visit login_path
    #   within('form') do
    #     fill_in 'Email', with: 'name@gmail.com'
    #     fill_in 'Password', with: 'apassword'
    #   end
    #   click_button 'Log in'
    #   expect(page).to have_content('Invalid email/password combination')
    # end
  end
end

# visit signup_path
#   fill_in 'Username', with: 'name'
#   fill_in 'Email', with: 'name@gmail.com'
#   fill_in 'Password', with: 'password'
#   fill_in 'Confirmation', with: 'password'
#   click_button 'Sign up'
