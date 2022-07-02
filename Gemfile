source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.3'

gem 'ffi'

gem 'pg'

gem 'sprockets-rails'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'

gem 'tzinfo-data'

gem 'bootsnap', require: false

gem 'rubocop', '>= 1.0', '< 2.0'

gem 'devise'

gem 'cancancan'

group :development, :test do
  gem 'better_errors'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'letter_opener'
  gem 'web-console'
end

group :development do
  gem 'sqlite3', '~> 1.4'
end

# group :production do
#   gem 'pg'
# end
