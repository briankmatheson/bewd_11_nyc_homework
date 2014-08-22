require 'rails_helper'

RSpec.describe DataFile, :type => :model do
  context "upload" do
    let!(:upload) {DataFile.create()}
      
    it "creates a new data file" do
      expect(DataFile.count).to eq 1
    end
  end
end
