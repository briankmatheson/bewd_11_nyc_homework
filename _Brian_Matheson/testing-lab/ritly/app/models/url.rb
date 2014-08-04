class Url < ActiveRecord::Base
  validates :link, presence:true

  def self.create(params)
    url = Url.new params
    url.hash_code = rand(1000000).to_s
    url.save
    return url
  end
end
