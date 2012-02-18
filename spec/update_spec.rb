require 'spec_helper'
require 'net/http'
require File.dirname(__FILE__) + './../update'

describe "Update" do
  it "should parse a valid tweet" do
    update = Update.new VALID_TWEET, CREATED_AT
    update.reaction.should == VALID_TWEET.split[0].chomp
    update.url.should == VALID_TWEET.split[1].chomp
    update.reason.should == VALID_TWEET.split[2..VALID_TWEET.split.length].join(" ")
    update.created_at.downcase.should == CREATED_AT_STRING.downcase
  end

  it "should throw an error for an invalid reaction" do
    expect { update = Update.new INVALID_REACTION_TWEET, CREATED_AT }.to raise_error(ArgumentError, "Invalid Reaction")
  end

  it "should throw an error for an invalid url" do
    expect { update = Update.new INVALID_URL_TWEET, CREATED_AT }.to raise_error(ArgumentError, "Invalid URL")
  end
end