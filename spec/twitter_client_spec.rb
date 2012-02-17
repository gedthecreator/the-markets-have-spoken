require 'mocha'
require 'twitter'
require File.dirname(__FILE__) + './../update'
require File.dirname(__FILE__) + './../twitter_client'

describe 'Twitter' do
  before(:each) do
    Twitter.configure do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.oauth_token = ENV['OAUTH_TOKEN']
      config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
    end
  end

  it "should" do
    
  end
end