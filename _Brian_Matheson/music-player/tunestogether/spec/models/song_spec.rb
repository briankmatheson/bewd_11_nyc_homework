require 'rails_helper'

RSpec.describe Song, :type => :model do

  context "creation" do

    let!(:song) do
      params = {name:"song"}
      Song.create(params)
    end

    let(:import) do
      Song.import_new_song("spec/01 Bubba Slide.mp3")
    end

    it "creates a new song" do
      expect(Song.count).to eq 1
    end
    it "imports a song" do
      expect(import.id).to be_present
    end
    it "decodes the id tag" do
      expect(import.name).to be_present
    end
    it "saves the correct name" do
      expect(import.name).to eq "Bubba Slide"
    end
  end
end

