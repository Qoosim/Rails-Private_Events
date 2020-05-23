# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @user = User.create(username: 'Test_user', email: 'test@user.com', password: '123456', password_confirmation: '123456')
    @event = Event.create(title: 'Test Event', description: 'Test Descripton', event_date: '2020-04-20', creator_id: 1 )
  end

  after(:each) do
    @user.destroy
    @event.destroy
  end

  context 'ActiveRecord Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:event_date) }
    it { should validate_presence_of(:location) }
  end

  context 'ActiveRecord Associations' do
    it { should have_many(:attendances) }
    it { should have_many(:attendees) }
    it { should belong_to(:creator) }

  end

  describe 'Event Model Validations' do
    it 'is invalid if the title is nil' do
      @event.title = nil
      expect(@event.valid?).not_to eq(true)
    end

    it 'is invalid if the description is nil' do
      @event.description = nil
      expect(@event.valid?).not_to eq(true)
    end

    it 'is invalid if the event date is empty' do
      @event.event_date = nil
      expect(@event.valid?).not_to eq(true)
    end

    it 'is invalid if the location is nil' do
      @event.location = nil
      expect(@event.valid?).not_to eq(true)
    end
  end
end