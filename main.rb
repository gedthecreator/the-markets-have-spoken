require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'haml'
require_relative 'update'

class Main < Sinatra::Base
  get '/' do
    @update = Update.new
    @update.reaction = 'Reaction'
    @update.reason = 'Reason'
    @update.url = 'http://www.google.com'
    haml :main
  end
end