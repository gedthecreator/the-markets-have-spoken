require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'haml'

class Main < Sinatra::Base
  get '/' do
    "Hello"
  end
end