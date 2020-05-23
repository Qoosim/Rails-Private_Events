# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Event', type: :feature do
  context 'Create a new event' do
    subject do
      User.new(username: 'testname', email: 'foobar@gmail.com', password: '123456', password_confirmation: '123456')
    end

    before do
      subject.save
      visit login_path
      within('form') do
        fill_in 'Email', with: 'foobar@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    scenario 'should create a new event' do
      visit create_path
      within('form') do
        fill_in 'Title', with: 'test'
        fill_in 'Description', with: 'test'
        fill_in 'Event Date', with: '2020-05-21'
        # select_date("2020,March,15", :from => "event_date")
        # page.find('event_date').set("2020-05-21")
        fill_in 'Location', with: 'test'
      end
      click_button 'Create'
      expect(page).to have_content('new event')
    end
  end
end
