require './main'

use Rack::Static, 
  :urls => ["/stylesheets", "/images"],
  :root => "public"

run Main.new