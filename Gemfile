source 'https://rubygems.org'

ruby '2.7.1'

gem 'puma'
gem 'rails', '~> 6.1.7'
gem 'pg', '~> 1' # Fix version until Rails supports 1.0.0

gem 'slim-rails'
gem 'sass-rails'
gem 'jquery-rails'
gem 'coffee-rails'
gem 'turbolinks'

gem 'bootstrap', '~> 5.2'
gem 'font-awesome-sass'

gem 'frozen_record'
gem 'rack-cors'
gem 'rails_utils'
gem 'httparty'
gem 'rufus-scheduler'
gem 'nokogiri', '>= 1.8.1'
gem 'rails-html-sanitizer', '>= 1.0.4'
gem 'telegram-bot', '~> 0.15.0'
gem 'rqrcode', '~> 1.0'

group :production do
  gem 'runtimeerror_notifier'
end

group :development, :test do
  gem 'dotenv-rails'

  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'pry-rails'

  gem 'rspec-rails'
  gem 'shoulda', require: false

  gem 'guard'
  gem 'guard-livereload'
  gem 'rack-livereload'

  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'webmock'
end
