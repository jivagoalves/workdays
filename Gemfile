source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development do
  gem 'rack', '1.3.3'
end

group :development, :test do
  gem 'rspec-rails', '2.6.1'
  gem 'factory_girl'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-inotify', :require => false if RUBY_PLATFORM =~ /linux/
  gem 'libnotify', :require => false if RUBY_PLATFORM =~ /linux/
end

group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'spork'
  gem 'launchy'
  gem 'guard-cucumber'
  gem 'guard-spork'
end

gem 'authlogic', '3.0.3'

group :production do
  # gems specifically for Heroku go here
  gem "pg"
end

