require "database_cleaner"

ENV["DATABASE_URL"] = "mongodb://localhost:27017"
DatabaseCleaner[:mongoid, { connection: "hanami_trial_test" }]

RSpec.configure do |config|
  config.before(:suite) do
    FactoryBot.find_definitions

    DatabaseCleaner[:mongoid].strategy = :truncation
    DatabaseCleaner[:mongoid].clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner[:mongoid].cleaning do
      example.run
    end
  end
end
