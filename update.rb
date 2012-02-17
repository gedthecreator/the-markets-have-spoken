class Update
    attr_accessor :reaction, :reason, :url

    
    def initialize(tweet)
        @reactions = ['sad', 'happy', 'calm', 'angry', 'tumultuous']    
        @reaction = tweet.split[0].chomp
        @url = tweet.split[1].chomp
        @reason = tweet.split[2..tweet.split.length].join(" ")
        validate
    end

    def validate
        if not @reactions.include?(@reaction.downcase)
            raise ArgumentError, "Invalid Reaction"
        end
    end
end