require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'haml'
require_relative 'update'
require_relative 'tweets'

class Main < Sinatra::Base
  get '/' do
    haml :main
  end
end