# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'
require 'twitter'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# TWITTER_CONSUMER_KEY = "gPgcw1pvo3ldLzicuhtFZg"
# TWITTER_CONSUMER_SECRET = "tIWAe7gTM6CNy2dOpm9h06lqUyDquNpCcHJNaTl3k"
# TWITTER_ACCESS_TOKEN = "1183738682-wKZU3MfXkpu7QftCKRjpF8K90LxvlchJuxedonW"
# TWITTER_ACCESS_TOKEN_SECRET = "ExUvUwFPKT1D1pMD31k6hXrKJzcJnR37VaEmg38Gj7Q"

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

Twitter.configure do |config|
  config.consumer_key = "gPgcw1pvo3ldLzicuhtFZg"
  config.consumer_secret = "tIWAe7gTM6CNy2dOpm9h06lqUyDquNpCcHJNaTl3k"
  # config.oauth_token = "1183738682-ivtl5nlVIKx0geLICLHxt3V0LkcWSsb1GNxdQIy"
  # config.oauth_token_secret = "5dXg8b922s4Z1uDTQNbV0ue9pk2bD98MPtEaG2xrZfQ"
end

# http://www.lknv83nvns0dkgf.com
