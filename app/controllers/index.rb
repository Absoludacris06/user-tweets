get '/' do
  erb :index
end

get '/:username' do
  # @tweets = []
  # @username = params[:username]
  # Twitter.user_timeline(@username)[0..9].each do |tweet|
  #   @tweets << tweet.text
  # end

  @user = TwitterUser.find_by_username(params[:username])
  
  if @user.nil?
    @user = TwitterUser.create(:username => params[:username])
    @user.fetch_tweets!
  elsif @user.tweets.empty? || @user.tweets_stale?
    @user.tweets.each { |tweet| tweet.destroy }
    @user.fetch_tweets!
  end
  @tweets = @user.tweets.limit(10)
  erb :index
end
