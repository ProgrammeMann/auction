source 'https://rubygems.org'

ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '5.1.3'

gem 'pg', '~> 0.18'

gem 'puma', '~> 3.7'

gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'devise'

gem "paperclip", "~> 5.0.0"

gem 'draper', "~> 3.0.0"
gem 'decent_exposure', '3.0.0'
gem 'decent_decoration', '~> 0.1.0'
gem 'activemodel-serializers-xml', git: 'https://github.com/rails/activemodel-serializers-xml'

gem 'slim'

gem 'sidekiq'
gem 'sinatra'
gem 'redis'
gem 'redis-namespace'

gem "rails-ujs"

gem 'omniauth'
gem "omniauth-google-oauth2"


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "letter_opener"
  gem 'letter_opener_web'
end
