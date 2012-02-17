require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'haml'
require 'twitter'
require File.dirname(__FILE__) + '/update'
require File.dirname(__FILE__) + '/twitter_client'

class Main < Sinatra::Base
  before do
    Twitter.configure do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.oauth_token = ENV['OAUTH_TOKEN']
      config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
    end

    @twitter_client = TwitterClient.new Twitter
  end

  get '/' do
    @update = @twitter_client.latest
    haml :main
  end
end