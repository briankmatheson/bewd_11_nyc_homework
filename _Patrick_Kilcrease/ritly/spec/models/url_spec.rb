require 'rails_helper'

RSpec.describe Url, :type => :model do
  context "making URL" do

  	it "create URL" do
  	@safe_url_params = "http://www.google.com"
  	Url.make_new_url(@safe_url_params)
  		expect(Url.count).to eq 1
  	end

  	

end
end
