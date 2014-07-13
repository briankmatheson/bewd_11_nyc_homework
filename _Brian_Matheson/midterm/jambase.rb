require_relative 'readable'
require_relative 'writable'

class JamBase
  include Readable
  include Writable

  attr_reader :data, :url

  def initialize(url)
    if self.read('jambase.dat')
      if @url == url
        return true
      else
        @url = url
        fetch_data_from_jambase
      end
    end
  end

  def fetch_data_from_jambase
    require 'rest-client'
    @data = JSON.load(RestClient.get(@url))
    self.write('jambase.dat')
  end

  def name
    data["Events"][0]["Venue"]["Name"] 
  end
  
  def city
    if results?
      return data["Events"][0]["Venue"]["City"]
    else
      return nil
    end
  end

  def state
    if results?
      return data["Events"][0]["Venue"]["State"]
    else
      return nil
    end
  end

  def results?
    data["Info"]["TotalResults"].to_i > 0
  end

end
