$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "eric/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "eric"
  s.version     = Eric::VERSION
  s.authors     = ["Taavo Smith"]
  s.email       = ["taavo@dd9.com"]
  s.homepage    = "http://github.com/taavo/eric"
  s.summary     = "Half of a CMS. The front half."
  s.description = "A CMS for sites which already have a back-end and don't want another. Pages, posts, and blocks."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.9"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
end
