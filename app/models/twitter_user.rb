require 'time'

class TwitterUser < ActiveRecord::Base
  has_many :tweets



  def fetch_tweets!
    Twitter.user_timeline(self.username).each do |tweet|
      Tweet.create(:text => tweet.text, :created_at => tweet.created_at, :twitter_user => self)
    end
    self.update_attributes(cache_time: Time.now, refresh_time: self.tweet_span_avg)
  end

  def tweets_stale?
    Time.now - self.cache_time > self.refresh_time ? true : false
  end

  def tweet_span_avg
    time_diff = []
    sample_tweets = self.tweets[0..9]
    sample_tweets.each_with_index do |tweet, i|
      time_diff.push(tweet.created_at - self.tweets[i+1].created_at)
    end

    time_diff.inject(:+) / time_diff.length
  end

end
