class Song < ActiveRecord::Base
  belongs_to :user

# not setting up association with data_file as url 
# might be external
# has_one :data_file

  require "mp3info"

  def self.import_new_song(filename, url, user)
    Mp3Info.open(filename) do |mp3|
      params = {}
      params[:name] = mp3.tag.title   
      params[:album] = mp3.tag.album
      params[:artist] = mp3.tag.artist  
      params[:data_url] = url
      params[:user_id] = user.id
      # mp3.tag.tracknum
      Song.create(params)
    end
  end
end
