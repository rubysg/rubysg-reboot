source 'https://rubygems.org'

ruby '2.7.1'

gem 'puma'
gem 'rails', '~> 5.0.7.1'
gem 'pg', '0.21.0' # Fix version until Rails supports 1.0.0

gem 'slim-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'coffee-rails'
gem 'turbolinks'

gem 'bootstrap-sass'
gem 'font-awesome-sass'

gem 'rails_utils'
gem 'httparty'
gem 'addressable'
gem 'rufus-scheduler'

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

gem 'nokogiri', '>= 1.8.1'

gem 'rails-html-sanitizer', '>= 1.0.4'
