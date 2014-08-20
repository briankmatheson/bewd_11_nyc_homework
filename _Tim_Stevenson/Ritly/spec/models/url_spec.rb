require 'rails_helper'

RSpec.describe Url, :type => :model do
  
  context "add url" do
  	before(:each) do
  		url = Url.new_with_hash(link: "http://google.com")
  		url.save
  	end

  	let(:url) {Url.find_by link: "http://google.com"}

  	it "creates url" do
  		expect(Url.count).to eq 1
  	end

  	it "gives url hash" do
  		url = Url.first
  		expect(url.hash_code.size).to eq 11 
  	end


  end

  context "test validation" do
  	it "doesn't validate without a link" do
  		url = Url.new_with_hash(link: "")
  		url.save
  		expect(false)
  	end
  end


end
