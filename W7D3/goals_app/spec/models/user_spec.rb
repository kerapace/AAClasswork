require 'rails_helper'

RSpec.describe User, type: :model do
    context "user input validations" do
        it {should validate_presence_of(:username)}
        it {should validate_length_of(:password).is_at_least(6)}
        it {should validate_presence_of(:password_digest)}
        it {should validate_presence_of(:session_token)}
    end

    subject(:user) {User.find_by_credentials("Test", "testing")}
        it {should validate_uniqueness_of(:username)}
    end
    before(:all) do 
        User.destroy
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


end
