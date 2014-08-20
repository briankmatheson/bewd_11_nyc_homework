require 'rails_helper'

RSpec.describe User, :type => :model do
  context "with password authentication" do

    before(:each) do
      User.create_with_password('test user', 'secret')
    end

    let(:authenticated_user) {User.find_authenticated_user('test user', 'secret')}

      
    it "creates with password" do
      expect(User.count).to eq 1
    end

    it "does not store plain text password" do 
      user = User.first
      expect(user.password).to eq "2bb80d537b1da3e38bd30361aa855686bde0eacd7162fef6a25fe97bf527a25b"
    end

    it "authenticates with password" do
      User.create_with_password('other user', 'bla bla bla')
      expect(authenticated_user.username).to eq 'test user'
    end
  
  end

  context "validations" do
    it "requires username and password" do
      user = User.new(username: 'bla', password: 'bla')
      expect(user).to be_valid
    end
  end

end
