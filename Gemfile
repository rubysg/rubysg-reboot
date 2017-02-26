source 'https://rubygems.org'

ruby '2.4.0'

gem 'puma'
gem 'rails', '~> 4.2'
gem 'pg'

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

group :production do
  gem 'rails_12factor'
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

gem 'nokogiri', '>= 1.6.8'

gem 'rails-html-sanitizer', '~> 1.0.3'
