require 'rails_helper'

RSpec.describe Url, :type => :model do
  context "creation" do

    let!(:url) {Url.create()}
    let!(:valid_url) {Url.create(link:'http://www.google.com')}

    it "creates a url" do
      expect(Url.count).to eq 2
    end
    
    it "requries a url as an argument" do
      expect(url.link).to_not be_valid
    end

    it "accepts a url as an argument" do
      expect(valid_url.link).to be_present
    end
  end
end
