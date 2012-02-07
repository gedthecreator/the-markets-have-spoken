require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'haml'
require_relative 'update'

class Main < Sinatra::Base
  get '/' do
    @update = Update.new
    @update.reaction = 'sad'
    @update.reason = 'Estelle is sleeping'
    @update.url = 'http://www.google.com'
    haml :'the-markets-have-spoken'
  end
end