# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'
gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.3.0.alpha3'
gem 'cpf_cnpj', '~> 0.5.0'
gem 'cssbundling-rails'
gem 'elasticsearch'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.5'
gem 'sassc-rails'
gem 'searchkick'

gem 'shrine', '~> 3.4'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'twilio-ruby', '~> 6.0', '>= 6.0.2'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker', '~> 5.4', '>= 5.4.4'

group :development, :test do
  gem 'byebug'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.2'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.2'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', require: false
  gem 'simplecov-cobertura', require: false
end

group :development do
  gem 'amazing_print'
  gem 'rubocop', require: false
  gem 'rubocop-faker'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'cpf_faker', '~> 1.3'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'jsbundling-rails', '~> 1.2'
