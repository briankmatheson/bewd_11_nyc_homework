class User < ActiveRecord::Base
  
  def create_user(params)
    user = User.new
    user.handle = params[:handle]
    user.email = params[:email]
    user.password = password_hash(params[:password])

    user.save
  end

  private
  def password_hash(password)
    return Digest::SHA2.hexdigest(password)
  end
end
