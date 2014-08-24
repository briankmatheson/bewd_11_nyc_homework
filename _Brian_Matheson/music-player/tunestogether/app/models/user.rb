class User < ActiveRecord::Base
  has_many :songs
  has_one :station

  def set_current_station(id)
    self.current_station = id
    self.save
  end
  
  def self.create_with_hashed_password(params)
    password = password_hash(params[:password])
    params[:password] = password
    User.create(params)
    user = User.where(handle:params[:handle])
    station = Station.new
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
