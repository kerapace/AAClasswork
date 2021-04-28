require 'rails_helper'

RSpec.describe User, type: :model do
    context "user input validations" do
        it {should validate_presence_of(:username)}
        it {should validate_length_of(:password).is_at_least(6)}
        it {should validate_presence_of(:password_digest)}
        it {should validate_presence_of(:session_token)}
    end

    subject(:user) {User.new}
    context "if username is not unique"
        it "should return error" {}
    end

end
