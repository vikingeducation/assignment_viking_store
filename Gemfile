source 'https://rubygems.org'

ruby '2.2.1'

gem 'rails', '4.2.4'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'faker'
gem 'thin'

group :development, :test do
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem 'quiet_assets'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :production do
  gem 'rails_12factor'
end
