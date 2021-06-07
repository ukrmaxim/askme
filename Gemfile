source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.3'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'rails-i18n', '~> 6.0.0' # For 6.0.0 or higher
gem 'uglifier'
gem 'rails_12factor'
gem 'recaptcha', '~> 5.8'

group :development do
  gem 'sqlite3', '~> 1.4'
  gem 'web-console', '>= 4.1.0'
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
