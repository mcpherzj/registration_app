source 'http://rubygems.org'


gem 'rails', '3.2.0'
#gem 'sqlite3-ruby', '1.3.2', :require => 'sqlite3'
gem 'rack-ssl-enforcer', :group => :production
gem 'spreadsheet', '0.6.5.4'

# for deployment on Heroku
gem "heroku"
gem 'pg'
gem 'thin'

group :production do
#  gem 'pg'
#  gem 'thin'
end

group :assets do
  gem 'sass-rails', "~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'sqlite3'
  gem 'rspec-rails', '2.5.0'
  gem 'annotate-models', '1.0.4'
end

group :test do
  gem 'rspec', '2.5.0'
  gem 'webrat'
  gem 'factory_girl_rails', '1.0'
end

gem 'jquery-rails'
