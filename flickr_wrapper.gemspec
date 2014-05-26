$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "flickr_wrapper/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "flickr_wrapper"
  s.version     = FlickrWrapper::VERSION
  s.authors     = ["kevin87"]
  s.email       = ["kevin.ho@flochip.com"]
  s.homepage    = "http://flochip.com/#/about/kevin"
  s.summary     = "Flickr Ruby Wrapper"
  s.description = "Flickr Ruby Wrapper"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "faraday"
  s.add_dependency "faraday_middleware"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
end
