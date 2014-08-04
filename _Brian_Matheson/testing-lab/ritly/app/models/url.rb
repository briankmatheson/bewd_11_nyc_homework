class Url < ActiveRecord::Base
  validates :link, presence:true

  def create (safe_url_params)
    @url = Url.new safe_url_params
    @url.hash_code = rand(1..1000000)

    # For the bonus
    # @url.hash_code = SecureRandom.urlsafe_base64(8)

    @url.save

    # Or create it in one shot by merging the random parameter into the safe params hash
    # @url = Url.create safe_url_params.merge(hash_code: SecureRandom.urlsafe_base64(8))
  end

end
