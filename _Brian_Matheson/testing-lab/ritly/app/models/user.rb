class User < ActiveRecord::Base
  validates :username, :password, presence: true
  validates :username, uniqueness: true

  def self.create_with_password(username, password)
    hash = password_hash(password)
    User.create(username: username, password: hash)
  end

  def self.find_authenticated_user(username, password)
    User.where(username:username, password: password_hash(password)).first
  end

  private 
  def self.password_hash(password)
    return Digest::SHA2.hexdigest(password)
  end
end
