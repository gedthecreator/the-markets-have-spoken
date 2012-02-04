require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'haml'

class TheMarketsHaveSpoken < Sinatra::Base
  get '/' do
    haml :'the-markets-have-spoken'
  end
end