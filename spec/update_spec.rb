require 'spec_helper'
require File.dirname(__FILE__) + './../update'

describe "Update" do
    it "should return an update for a valid tweet" do
        update = Update.new VALID_TWEET
        update.reaction.should == VALID_TWEET.split[0].chomp
        update.url.should == VALID_TWEET.split[1].chomp
        update.reason.should == VALID_TWEET.split[2..VALID_TWEET.split.length].join(" ")
    end

    it "should throw an error for an invalid reaction" do
        expect { update = Update.new INVALID_REACTION_TWEET }.to raise_error(ArgumentError, "Invalid Reaction")
    end

    it "should throw an error for an invalid url" do
        expect { update = Update.new INVALID_URL_TWEET }.to raise_error(ArgumentError, "Invalid URL")
    end
end