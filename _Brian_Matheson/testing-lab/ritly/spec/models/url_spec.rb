require 'rails_helper'

RSpec.describe Url, :type => :model do
  context "constructor" do

    let(:valid_url) {Url.create(link:'http://www.google.com')}

    it "creates a db entry" do
      expect(valid_url.link).to be_present
      expect(Url.count).to eq 1
    end

    it "accepts a url as an argument" do
      expect(valid_url.link).to be_present
    end

    it "validates the record" do
      expect(valid_url).to be_valid
    end

    it "makes up a hash code" do
      expect(valid_url.hash_code).to be_present
    end
  end
end
