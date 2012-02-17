require 'twitter'
require File.dirname(__FILE__) + '/update'

class TwitterClient
  def initialize (twitter)
    @twitter = twitter
  end

  def latest
    Update.new @twitter.direct_messages[0].text
  end
end