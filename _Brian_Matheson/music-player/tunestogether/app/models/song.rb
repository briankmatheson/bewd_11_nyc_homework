class Song < ActiveRecord::Base
  # def import_new_song(filename)
  #   Mp3Info.open(filename) do |mp3|
  #     params[:name] = mp3.tag.title   
  #     params[:album] = mp3.tag.album
  #     params[:artist] = mp3.tag.artist   
  #     # mp3.tag.tracknum
  #   end
  #   Song.create(params)
  # end
end
