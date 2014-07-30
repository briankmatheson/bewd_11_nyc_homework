class Users < ActiveRecord::Base
  validates :user, :pw_hash, presence: true
  validates :user, uniqueness: true

  def self.new_user(user, password)
    myhash = make_hash(password)
    Users.create(user: user, pw_hash: myhash)
  end

  def self.find_user(user, password)
    myhash = make_hash(password)
    
    if uobj = Users.find_by(pw_hash: myhash)
      return uobj
    else
      return nil
    end
  end

  private
  def self.make_hash(password)
    return Digest::SHA2.hexdigest(password)
  end
end
