class User < ActiveRecord::Base
  has_many :songs
  has_one :station
  
  def self.create_with_hashed_password(params)
    password = password_hash(params[:password])
    params[:password] = password
    user = User.create(params)
    station = Station.create
    station.user_id = user.id
    station.save
    user.current_station = station.id
    user.save
  end

  def self.find_with_hashed_password(params)
    password = password_hash(params[:password])
    handle = params[:handle]
    User.where(handle:handle, password:password).first
  end

  private
  def self.password_hash(password)
    return Digest::SHA2.hexdigest(password)
  end
end
