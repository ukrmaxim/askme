source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3'
gem 'rails-i18n', '~> 6.0.0'
gem 'recaptcha', '~> 5.8'
gem 'uglifier'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  gem 'listen'
  gem 'pry-rails'
  gem 'sqlite3', '~> 1.4'
end

group :production do
  gem 'pg'
end
