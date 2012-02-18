require 'mocha'
require 'twitter'

VALID_TWEET = "Happy http://goo.gl/D07Lw Greece looks close to being bailed out"
INVALID_REACTION_TWEET = "Thoughtative http://goo.gl/D07Lw Greece looks close to being bailed out"
INVALID_URL_TWEET = "Happy http//goo.gl/D07Lw Greece looks close to being bailed out"
CREATED_AT = Time.utc(2012,"FEB",14,14,15,31)
CREATED_AT_STRING = "Tuesday 14th February 2012 at 14:15"

class SpecHelper
  def mock_direct_message (reaction, created_at)
    direct_message = Twitter::DirectMessage.new
    direct_message.stubs(:text).returns(reaction)
    direct_message.stubs(:created_at).returns(created_at)
    messages = [ direct_message ]

    twitter = Twitter::Base.new
    twitter.stubs(:direct_messages).returns(messages)
    return twitter
  end
end