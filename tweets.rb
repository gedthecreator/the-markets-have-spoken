require_relative 'update'

class Tweets
    def latest
        @update = Update.new
        @update.reaction = 'Sad'
        @update.url = 'http://uk.reuters.com/article/2012/02/06/markets-global-idUKL2E8D6GUG20120206'
        @update.reason = 'everyone is waiting for greece to do something'
    end    
end