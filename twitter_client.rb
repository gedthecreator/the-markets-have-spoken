require 'twitter'
require File.dirname(__FILE__) + '/update'

class TwitterClient
  def initialize (twitter)
    @twitter = twitter
  end

  def latest
    direct_message = @twitter.direct_messages[0]
    created_at = direct_message.created_at
    Update.new direct_message.text , created_at
  end
end