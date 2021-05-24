source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# Centralization of locale data collection for Ruby on Rails
gem 'rails-i18n', '~> 6.0.0' # For 6.0.0 or higher
gem 'uglifier'
gem 'rails_12factor'
gem 'recaptcha', '~> 5.8'

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.4'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
end

group :development, :test do
  gem 'pry-rails'
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
end

group :production do
  gem 'pg'
end
