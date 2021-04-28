require 'rails_helper'

RSpec.describe User, type: :model do
    context "user input validations" do
        it {should validate_presence_of(:username)}
        it {should validate_length_of(:password).is_at_least(6)}
        it {should validate_presence_of(:password_digest)}
        it {should validate_presence_of(:session_token)}
        it {should validate_uniqueness_of(:username)}
    end

    subject(:user) {User.find_by_credentials("Test", "testing")}
       
    before(:all) do 
        User.destroy_all
        User.new(username: "Test", password: "testing").save 
    end
    describe "::find_by_credentials" do 
        it "should find extant database entries" do 
            expect(User.find_by_credentials(user.username, "testing")).to eq(user)
        end
        it "it should return nil if there is no such entry in the database" do 
            expect(User.find_by_credentials("Test", "oranges")).to be(nil)
            expect(User.find_by_credentials("cat", "testing")).to be(nil)
        end
    end
    
    describe "password=" do
        it "should take in a password argument" do
            expect {user.password = "fifteen"}.to_not raise_error
        end

        it "should set password to an instance variable" do
            user.password = "foobar"
            expect(user.password).to eq("foobar")
        end

        it "should call BCrypt::Password.create" do
            expect(BCrypt::Password).to receive(:create).with("foobar")
            user.password = "foobar"
        end

        it "should initialize password_digest" do
            new_user = User.new(username: "foo")
            new_user.password = "foobar"
            expect(new_user.password_digest).to_not be(nil)
        end
    end

    describe "#is_password?" do 
        it "should return true when the same password is passed in" do 
            expect(user.is_password?("testing")).to be(true)
        end

        it "it should return false if the password is not the same" do 
            expect(user.is_password?("toasting")).to be(false)
        end

        it "it should not access the password variable" do 
            expect(user).to_not receive(:password)
        end
    end

    describe "#reset_session_token!" do 
        it "should set the session token to a new value" do 
            token = user.session_token
            user.reset_session_token! 
            expect(user.session_token).to_not eq(token)
        end

        it "it should save the new token into the database" do 
            expect(user).to receive(:save!)
            user.reset_session_token! 
        end
    end

    describe "#ensure_session_token" do 
        it "should initialize the session token field" do
            new_user = User.new(username: "max", password: "123456")
            new_user.ensure_session_token
            expect(new_user.session_token).to_not be(nil)
        end
    end
end
