source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.8'
gem 'rails', '~> 5.2.4', '>= 5.2.4.4'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
# gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'slim-rails'
gem 'html2slim'
gem 'bootstrap-sass'
gem 'rubocop-airbnb'
gem 'aws-sdk-s3', '1.46.0', require: false
gem 'bcrypt', '3.1.13'
gem 'carrierwave'
gem 'rmagick'
gem 'devise'
gem 'webpacker'
gem 'jquery-rails'
gem 'will_paginate',           '3.1.8'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'active_storage_validations', '0.8.2'
gem 'image_processing',           '1.9.3'
gem 'mini_magick'
gem "gmaps4rails"
gem "geocoder"
gem "gon"
gem "dotenv-rails"
gem 'ransack'
gem 'counter_culture', '~> 1.8'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0.1'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  # gem 'pg', '>= 0.18', '< 2.0'
end

group :development do
  gem 'annotate'
  gem 'bullet'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers', '~> 3.0'
end

group :production do
  gem 'unicorn', '5.4.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
