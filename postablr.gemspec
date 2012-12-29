$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "postablr/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "postablr"
  s.version     = Postablr::VERSION
  s.authors     = ["Miguel Michelson"]
  s.email       = ["miguelmichelson@gmail.com"]
  s.homepage    = "http://github.com/michelson"
  s.summary     = "Postablr is blog mountable engine."
  s.description = "Postablr a mountable blog engine similar with focus on tumblr entries style"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "sanitize"
  s.add_dependency "carrierwave"
  s.add_dependency "inherited_resources"
  s.add_dependency "acts-as-taggable-on"
  s.add_dependency "haml"
  s.add_dependency "mini_magick"
  s.add_dependency "kaminari"

  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency "shoulda-matchers", "~>1.0"#, "~> 3.0"
  s.add_development_dependency "database_cleaner"

end
