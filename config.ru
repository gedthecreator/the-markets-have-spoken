require './main'

use Rack::Static, 
  :urls => ["/stylesheets", "/images", "/js"],
  :root => "public"

run Main.new