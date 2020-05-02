source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# App and System gems
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'pg', '>= 0.18', '< 2.0'                        # Use postgresql as the database for Active Record
gem 'jbuilder', '~> 2.7'                            # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'redis', '~> 4.0'                               # Use Redis adapter to run Action Cable in production
gem 'bcrypt', '~> 3.1.7'                            # Use Active Model has_secure_password
gem 'unicorn'                                       # Web Server used in docker
gem 'bootsnap', '>= 1.4.2', require: false          # Reduces boot times through caching; required in config/boot.rb
gem 'rack-timeout', '~> 0.5'                        # Use Rack Timeout. Read more: https://github.com/heroku/rack-timeout
gem 'rswag'                                         # Rswag extends rspec-rails "request specs" with a Swagger-based DSL for describing and testing API operations.
gem 'rack-cors'                                     # Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'devise'
gem 'simple_token_authentication', '~> 1.0'
# gem 'sidekiq', '~> 5.1'                             # Use Sidekiq as a background job processor through Active Job
# gem 'clockwork', '~> 2.0'                           # Use Clockwork for recurring background tasks without needing cron
# gem "attr_encrypted", "~> 3.0.0"                    # Encrypt fields in the DB https://github.com/attr-encrypted/attr_encrypted
# gem 'aws-sdk', '~> 3'                               # AWS SDK gem https://aws.amazon.com/sdk-for-ruby/
# gem "cocoon"                                        # NEsted Forms
# gem 'paper_trail'                                   # For versioning of model
# gem 'validate_url'                                  # validates that url is valid
# gem 'date_validator'                                # A simple date validator for Rails
# gem 'image_processing', '~> 1.2'                    # Use Active Storage variant



group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]   # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "rspec-rails"
  gem 'guard'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard', '~> 1.6.1'
  gem "factory_bot_rails"
end

group :development do
  gem 'rename'
  gem 'better_errors'
  gem 'web-console', '>= 3.3.0'               # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'                                # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'rails_real_favicon'                    # Creates rails supported favicon
  gem 'rails-erd'                             # creates database diagrams
  gem "lol_dba"                               # Find missing indexs
  gem 'rack-mini-profiler', '~> 1.0'          # Enable a debug toolbar to help profile your application
  gem 'sitemap'                               # generate Site map
end

group :test do
  # gem 'capybara', '>= 2.15', '< 4.0'          # Adds support for Capybara system testing and selenium driver
  # gem 'capybara-screenshot'
  # gem 'selenium-webdriver'                    # Easy installation and use of chromedriver to run system tests with Chrome
  # gem 'chromedriver-helper'
  # gem 'simplecov', :require => false
  # gem 'shoulda-matchers', '~> 3.0', require: false
  # gem 'database_cleaner', '~> 1.5'
  # gem 'faker'
  # gem 'pry-byebug'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
