class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    
    @safe_url_params = params.require(:url).permit(:link)
    Url.make_new_url(@safe_url_params)

    #@url = Url.new @safe_url_params
    #@url.hash_code = rand(1..1000000)

    # For the bonus
    # @url.hash_code = SecureRandom.urlsafe_base64(8)

    #@url.save

    # Or create it in one shot by merging the random parameter into the safe params hash
    # @url = Url.create safe_url_params.merge(hash_code: SecureRandom.urlsafe_base64(8))
    #@url.save
    
    
    redirect_to :controller => 'urls', :action => 'show', :id => Url.last
    

  end

  def show
    @url = Url.find params[:id]
    @full_path = "#{request.protocol}#{request.host_with_port}/#{@url.hash_code}"
  end

  def redirector
    @url = Url.find_by hash_code: params[:code]
    if @url
      redirect_to @url.link
    else
      redirect_to root_path
    end
  end

  def preview
    @url = Url.find_by hash_code: params[:code]
    unless @url
      redirect_to root_path
    end
  end
end
