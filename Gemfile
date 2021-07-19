source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Use sqlite3 as the database for Active Record
gem 'active_storage_validations', '0.8.2'
gem 'aws-sdk-s3', '1.46.0', require: false
gem 'bcrypt', '3.1.13'
gem 'bootsnap', '1.4.5', require: false
gem 'bootstrap-sass', '3.4.1'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'carrierwave'
gem 'debase'
gem 'devise'
gem 'dotenv-rails'
gem 'faker', '2.1.2'
gem 'fog'
gem 'image_processing', '1.9.3'
gem 'jbuilder', '2.9.1'
gem 'mini_magick', '4.9.5'
gem 'mysql2'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'puma'
gem 'rails', '~> 6.1.1'
gem 'rmagick'
gem 'ruby-debug-ide'
gem 'sassc', '2.1.0'
gem 'sass-rails', '6'
gem 'turbolinks', '5.2.0'
gem 'webpacker'
gem 'will_paginate', '3.1.8'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'letter_opener_web'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec'
  gem 'spring', '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'capybara',                 '3.28.0'
  gem 'rails-controller-testing', '1.0.4'
  gem 'selenium-webdriver',       '3.142.4'
  gem 'webdrivers',               '4.1.2'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'spring-commands-rspec'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
