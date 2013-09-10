get '/' do
  erb :index
end

post '/loading' do

  @user = TwitterUser.find_by_username(params[:username])
  
  if @user.nil?
    @user = TwitterUser.create(:username => params[:username])
    @user.fetch_tweets!
  elsif @user.tweets.empty? || @user.tweets_stale?
    @user.tweets.each { |tweet| tweet.destroy }
    @user.fetch_tweets!
  end
  @tweets = @user.tweets.limit(10)
  erb :_tweet_list, :layout => false
  
end
