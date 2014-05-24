require "faraday"
require "faraday_middleware"
require "flickr_wrapper/connection"

Dir[File.dirname(__FILE__) + '/flickr_wrapper/*.rb'].each do |file|
  require file
end

module FlickrWrapper
end
