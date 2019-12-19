require "factory_bot"

FactoryBot.define do
  to_create do |instance|
    # This works with Hanami > 0.9
    # If you are using an older version, just remove #new method in line below
    repository = Object.const_get("#{instance.class}Repository").new
    repository.create(instance.attributes)
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
