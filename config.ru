require "bundler/setup"
Bundler.require(:default)
require "./main"

use Rack::Static, :urls => ["/css","/img"], :root => "public"

run Rack::URLMap.new \
  "/archives" => Picture.new
