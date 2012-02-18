require 'mocha'
require 'twitter'
require 'spec_helper'
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
    @spec_helper = SpecHelper.new
  end

  it "should return valid update for valid tweet" do
    @twitter = @spec_helper.mock_direct_message(VALID_TWEET, CREATED_AT)

    twitter_client = TwitterClient.new @twitter

    latest = twitter_client.latest

    latest.reaction.should == VALID_TWEET.split[0].chomp
    latest.url.should == VALID_TWEET.split[1].chomp
    latest.reason.should == VALID_TWEET.split[2..VALID_TWEET.split.length].join(" ")
  end

  it "should throw an error if the reaction is incorrect" do
    @twitter = @spec_helper.mock_direct_message(INVALID_REACTION_TWEET, CREATED_AT)

    twitter_client = TwitterClient.new @twitter

    expect {latest = twitter_client.latest}.to raise_error(ArgumentError, 'Invalid Reaction')
  end
  
  it "should throw an error if the url is incorrect" do
    @twitter = @spec_helper.mock_direct_message(INVALID_URL_TWEET, CREATED_AT)

    twitter_client = TwitterClient.new @twitter

    expect {latest = twitter_client.latest}.to raise_error(ArgumentError, 'Invalid URL')
  end
end