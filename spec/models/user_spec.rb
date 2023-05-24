require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save user when all required fields are set correctly' do
      @user = User.new(name: 'Popuri', email: 'pol@test.com', password: "123456", password_confirmation: "123456")
      expect(@user).to be_valid
    end

    it 'should not save if password and password_confirmation do not match' do
      @user = User.new(name: 'Popuri', email: 'pol@test.com', password: "123456", password_confirmation: "test")
      @user.save 
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should provide an error message if password not set' do
      @user = User.new(name: 'Popuri', email: 'pol@test.com', password: nil, password_confirmation: nil)
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should provide an error message if name not set' do
      @user = User.new(name: nil, email: 'pol@test.com', password: "123456", password_confirmation: "123456")
      @user.save
      # expect(@user).to_not be_valid
      # puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'should provide an error message if email not set' do
      @user = User.new(name: 'Popuri', email: nil, password: "123456", password_confirmation: "123456")
      @user.save
      # expect(@user).to_not be_valid
      # puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should provide an error message if email is not unique' do
      @user_1 = User.new(name: 'Popuri', email: 'pol@test.com', password: "123456", password_confirmation: "123456")
      @user_1.save
      @user_2 = User.new(name: 'Porine.', email: 'pol@test.com', password: "sails567", password_confirmation: "sails567")
      @user_2.save
      expect(@user_2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should have a minimun password length' do
      @user = User.new(name: 'Popuri', email: 'pol@test.com', password: "We", password_confirmation: "We")
      @user.save
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 5 characters)')
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
