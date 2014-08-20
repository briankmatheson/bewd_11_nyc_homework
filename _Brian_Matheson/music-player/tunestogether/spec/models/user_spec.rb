require 'rails_helper'

RSpec.describe User, :type => :model do
  context "creation" do
    let!(:user) {User.create_user({handle:"test", email:"root@localhost", password:"test"})}
    
    it "creates a user" do
      expect(User.count).to eq 1
    end
    it "includes an email address" do
      expect(user.email).to be_present
    end
    it "includes a password" do
      expect(user.password).to be_present
    end
    it "encrypts the password" do
      expect(user.password).to_not eq "test"
    end
  end
end
