class Session < ActiveRecord::Base
	validates :user_name, :password, presence: true
  validates :user_name, uniqueness: true

  def self.create_with_password(user_name, password)
    hash = password_hash(password)
    Session.create(user_name: user_name, password: hash)
  end

  def self.find_authenticated_user(user_name, password)
    Session.where(user_name:user_name, password: password_hash(password)).first
  end

  private 
  def self.password_hash(password)
    return Digest::SHA2.hexdigest(password)
  end
end
