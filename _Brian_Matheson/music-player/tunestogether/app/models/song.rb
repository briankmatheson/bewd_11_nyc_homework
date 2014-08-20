require "mp3info"

class Song < ActiveRecord::Base
  
  def self.import_new_song(filename)
    Mp3Info.open(filename) do |mp3|
      params = {}
      params[:name] = mp3.tag.title   
      params[:album] = mp3.tag.album
      params[:artist] = mp3.tag.artist   
      # mp3.tag.tracknum
      Song.create(params)
    end
  end
end
