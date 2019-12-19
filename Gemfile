source "https://rubygems.org"

gem "rake"
gem "hanami"
gem "mongoid"
gem "sidekiq"

group :development do
  # Code reloading
  # See: https://guides.hanamirb.org/projects/code-reloading
  gem "shotgun", platforms: :ruby
end

group :test, :development do
  gem "dotenv", "~> 2.4"
  gem "pry"
end

group :test do
  gem "rspec"
  gem "factory_bot"
  gem "database_cleaner"
end

group :production do
  gem "puma"
end
