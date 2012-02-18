require 'active_support/core_ext/integer/inflections'

class Update
  URL_REGEX = 'https?:\/\/([-\w\.]+)+(:\d+)?(\/([\w\/_\.]*(\?\S+)?)?)?'
  attr_accessor :reaction, :reason, :url, :created_at

  def initialize(tweet, created_at)
    @reactions = ['sad', 'happy', 'calm', 'angry', 'tumultuous']    
    @reaction = tweet.split[0].chomp
    @url = tweet.split[1].chomp
    @reason = tweet.split[2..tweet.split.length].join(" ")
    @created_at = created_at.strftime("%A #{created_at.day.ordinalize} %B %Y at %H:%M")
    validate
  end

  def validate
    if not @reactions.include?(@reaction.downcase)
      raise ArgumentError, "Invalid Reaction"
    end

    if @url.match(URL_REGEX).nil?
        raise ArgumentError, "Invalid URL"
    end
  end
end