if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source "http://rubygems.org"

# Declare your gem's dependencies in postablr.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"
gem "acts_as_unvlogable" , :git=>"git@github.com:michelson/acts_as_unvlogable.git"
gem "formtastic" # ???? replace it for normal rails form helper
gem "simple_form"
gem "acts-as-taggable-on"
gem "sanitize"
gem "carrierwave"
gem "inherited_resources"
gem "acts-as-taggable-on"
gem "haml"
gem "mini_magick"
gem "kaminari"
gem "devise"
gem "redactor-rails"
gem 'bootstrap-datepicker-rails'
gem 'flash_cookie_session'
gem "plupload-rails"
gem "state_machine"

group :assets do
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'execjs'
end

gem 'bootstrap-sass', '~> 2.2.1.1'
gem 'jquery-ui-rails'
gem 'turbolinks'
gem "thin"

group :test do
  gem "capybara"
end
# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
group :development, :test do
  #gem 'ruby-debug'
  gem "debugger"
end
