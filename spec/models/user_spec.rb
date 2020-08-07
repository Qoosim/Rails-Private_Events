require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(username: 'Test_user', email: 'test@user.com', password: '123456',
                        password_confirmation: '123456')
    @event = Event.create(title: 'Test Event', description: 'Test Descripton',
                          date: '04-20-2020', creator_id: 1)
  end

  it 'ensures username not to be nil' do
    @user.username = nil
    expect(@user).to_not be_valid
  end

  it 'ensures email not to be nil' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'ensures correct email format be given' do
    @user.email = 'alaje.plenty.com'
    expect(@user).to_not be_valid
  end

  it 'ensures correct email is saved' do
    @user.email = 'alaje@plenty.com'
    expect(@user).to be_valid
  end

  it 'ensures password should not be nil' do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it 'ensures username not to be too short' do
    @user.username = 'dd'
    expect(@user).to_not be_valid
  end

  it 'ensures password not to be too short' do
    @user.password = '12345'
    expect(@user).to_not be_valid
  end

  it 'ensures matching password' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    expect(@user).to_not be_valid
  end

  describe 'ActiveRecord Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should have_secure_password }
  end

  context 'ActiveRecord Associations' do
    it { should have_many(:attendances) }

    it { should have_many(:attended_events) }
  end
end
