class Url < ActiveRecord::Base

def self.make_new_url(params)
	#params = @safe_url_params
	@url = Url.new params 
	@url.hash_code = rand(1..1000000)
	

    #@url = Url.new @safe_url_params
    
    
    @url.save

end



end
