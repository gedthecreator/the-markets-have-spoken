require "rspec"
require_relative './../../update'

describe UpdateTest do
    VALID_TWEET = "Sad http://goo.gl/D07Lw Standard & Poor are threatening downgrades in Europe"
    INVALID_REACTION_TWEET = "Bewildered http://goo.gl/D07Lw Standard & Poor are threatening downgrades in Europe"
    INVALID_URL_TWEET = "Sad htt://goo.gl/D07Lw Standard & Poor are threatening downgrades in Europe"


    it "should parse a valid tweet" do
        update = Update.new VALID_TWEET
        update.reaction.should equal "Sad"
        update.url.should equal "http://goo.gl/D07Lw"
        update.reason.should equal "Standard & Poor are threatening downgrades in Europe"
    end

    it "should fail when no url is supplied" do
            
    end

    it "should fail when no reaction is supplied" do
        lambda{Update.new INVALID_REACTION_TWEET}.should raise_error 
    end

    it "should fail when no reason is supplied" do

    end
end