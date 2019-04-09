class LandingController < ApplicationController
  def callback
    response = Instagram.get_access_token(params[:code], redirect_uri: ENV['REDIRECT_URI'], client_secret: ENV['CLIENT_SECRET'])
    session[:access_token] = response.access_token
    redirect_to root_path
  end

  def index 
    uri = URI('https://api.instagram.com/v1/users/self/media/recent/?access_token=9991580933.aa7bad3.b8ddb891b52c4314980dfbccfc6fc981')

    response = Net::HTTP.get_response(uri).body
    @stuff = JSON.parse(response)["data"]
    @tags = []
    @stuff.each do |x|
      @tags.push(x)
    end

    culled = @tags.select {|item| "mypersonalwine" == item["tags"][0]}
    

    # binding.pry
    @urls = []

    culled.each do |x|
      @urls.push(x['images']['thumbnail']['url'])
    end

    ####################################################

  end
end