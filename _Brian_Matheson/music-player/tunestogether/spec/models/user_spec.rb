require 'rails_helper'

RSpec.describe User, :type => :model do
  context "creation" do
    let!(:user) do
      params = {handle:"test", 
        email:"root@localhost", 
        password:"test"}

      User.create_with_hashed_password(params)
    end

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
  context "lookup" do
    let!(:user) do
      params = {handle:"test", 
        email:"root@localhost", 
        password:"test"}

      User.create_with_hashed_password(params)
    end

    let!(:lookup) do
      params = {handle:"test", password:"test"}
      User.find_with_hashed_password(params)
    end

    it "looks up an authenticated user" do
      expect(lookup.id).to be_present
    end
  end
end
