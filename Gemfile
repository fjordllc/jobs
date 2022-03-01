# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby RUBY_VERSION

gem 'active_decorator'
gem 'autoprefixer-rails'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'font-awesome-sass', '~> 5.12.0'
gem 'high_voltage'
gem 'image_processing', '~> 1.12'
gem 'jbuilder', '~> 2.7'
gem 'meta-tags'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 5.6'
gem 'rack-user_agent'
gem 'rails', '~> 6.0.3'
gem 'rails-i18n'
gem 'sass-rails', '>= 6'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'letter_opener'
  gem 'listen', '~> 3.2'
  gem 'pry-rails'
  gem 'rubocop', '~> 0.82.0', require: false
  gem 'rubocop-minitest'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'xray-rails', git: 'git://github.com/brentd/xray-rails.git', branch: 'master'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
