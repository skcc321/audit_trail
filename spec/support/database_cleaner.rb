require "database_cleaner"

# setup connection for database cleaner
ENV["DATABASE_URL"] = "mongodb://#{Mongoid.clients.dig('default', 'hosts').first}"
DatabaseCleaner[:mongoid, { connection: Mongoid.clients.dig("default", "database") }]

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner[:mongoid].strategy = :truncation
    DatabaseCleaner[:mongoid].clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner[:mongoid].cleaning do
      example.run
    end
  end
end
