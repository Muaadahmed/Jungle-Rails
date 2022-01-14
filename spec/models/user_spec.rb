require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'User is valid with all valid attributes' do
      @user = User.create(name: "Elliot", email: "e.elliot@gmail.com", password: "password", password_confirmation: "password", first_name: "Elliot", last_name: "Alexander")
      expect(@user).to be_valid
    end

    it 'User is invalid if first_name is not present' do 
      @user = User.create(name: "Elliot", email: "e.elliot@gmail.com", password: "password", password_confirmation: "password", last_name: "Alexander")
      expect(@user).to_not be_valid 
      expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
    end

    it 'User is invalid if last_name is not present' do 
      @user = User.create(name: "Elliot", email: "e.elliot@gmail.com", password: "password", password_confirmation: "password", first_name: "Elliot")
      expect(@user).to_not be_valid 
      expect(@user.errors.full_messages[0]).to eq("Last name can't be blank")
    end

    it 'User is invalid if password and password confirmation don\'t match' do 
      @user = User.create(name: "Elliot", email: "e.elliot@gmail.com", password: "password", password_confirmation: "wordpass", first_name: "Elliot", last_name: "Alexander")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
    end

    it 'User is invalid if password confirmation isn\'t present' do 
      @user = User.create(name: "Elliot", email: "e.elliot@gmail.com", password: "password", first_name: "Elliot", last_name: "Alexander")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to eq("Password confirmation can't be blank")
    end

    it 'User is invalid if password isn\'t present' do 
      @user = User.create(name: "Elliot", email: "e.elliot@gmail.com", first_name: "Elliot", last_name: "Alexander")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to eq("Password can't be blank")
    end

    it "User is invalid if password is less than 3" do
      @user = User.create(name: "Elliot", email: "e.elliot@gmail.com", password: "pa", password_confirmation: "pa", first_name: "Elliot", last_name: "Alexander")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 3 characters)")
    end
    # it 'User should be created with password and password confirmation' do 
    #   @user = User.create(name: "Elliot", email: "e.elliot@gmail.com", password: "password", password_confirmation: "Password")
    #   expect(@user.password_confirmation).to_not be_nil
    # end

    it 'User is valid if email is unique' do 
      @user = User.create(name: "Elliot", email: "e.elliot@gmail.com", password: "password", password_confirmation: "password", first_name: "Elliot", last_name: "Alexander")
      @user2 = User.create(name: "Elliot", email: "E.elliot@gmail.com", password: "password", password_confirmation: "password", first_name: "Elliot", last_name: "Alexander")

      expect(@user).to be_valid
      expect(@user.errors.full_messages[0]).to eq(nil)

      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages[0]).to eq("Email has already been taken")
    end
  end
  describe '.authenticate_with_credentials' do
    it 'User is valid if email has a space before and after' do
      # @user = User.create(name: "Muaad", email: "e.elliot@gmail.com", password: "password", password_confirmation: "password", first_name: "Elliot", last_name: "Alexander")
      email = " e.elliot@gmail.com "
      password = "password"
      p User
      user = User.find_by(email: "e.elliot@gmail.com")
      userSession = user.authenticate_with_credentials(email, password)
      p "usersession ------->", userSession
      expect(userSession).to be_valid
      byebug
    end
  end
end
