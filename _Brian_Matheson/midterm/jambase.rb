require_relative 'readable'
require_relative 'writable'

class JamBase
  include Readable
  include Writable

  attr_reader :data, :url

  def initialize
    if self.read('jambase.dat')
      return true
    else
      @url = 'http://api.jambase.com/events?artistId=1977&api_key=6wc8war5yfb7mnd3b8vxazyf&o=json'
  
      require 'rest-client'
      @data = JSON.load(RestClient.get(url))
      self.write('jambase.dat')
    end
  end

  def name
    data["Events"][0]["Venue"]["Name"] 
  end
  
  def city
    data["Events"][0]["Venue"]["City"] 
  end
end
