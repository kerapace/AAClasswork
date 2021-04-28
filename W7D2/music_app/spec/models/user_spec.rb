require 'rails_helper'
RSpec.describe User, type: :model do
  before(:all) do 
    User.destroy_all
    User.new(email: 'test@test.test', password: 'grapes').save
  end
  context "user input should be provided" do
    it {should validate_presence_of(:email)}
  end

  context "password digest and session token should both be created" do
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
  end

  context "password length must be at least 6" do
    it {should validate_length_of(:password).is_at_least(6).allow_nil}
  end

  subject(:new_user) {User.find_by_credentials('test@test.test','grapes')}
  describe "#is_password?" do
    it 'should return true when the same password is passed in' do
      expect(new_user.is_password?('grapes')).to be(true)
    end

    it 'should return false when the password does not match' do
      expect(new_user.is_password?('oranges')).to be(false)
    end

    it 'should not access the password variable' do
      expect(new_user).to_not receive(:password)
      new_user.is_password?('oranges')
    end
  end

  describe "#reset_session_token!" do
    it 'should set the session token to a new value' do
      token = new_user.session_token
      new_user.reset_session_token!
      expect(new_user.session_token).to_not eq(token)
    end

    it 'should save the new token into the database' do
      expect(new_user).to receive(:save!)
      new_user.reset_session_token!
    end
  end

  describe "::find_by_credentials" do
    it 'should find extant database entries' do
      expect(User.find_by_credentials('test@test.test','grapes')).to eq(new_user)
    end

    it 'should return nil if there is no such entry in the database' do
      expect(User.find_by_credentials('test@test.test','oranges')).to be(nil)
      expect(User.find_by_credentials('num@yahoo.com','grapes')).to be(nil)
    end
  end
end