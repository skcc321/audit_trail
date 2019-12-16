require 'bundler/setup'
require 'hanami/setup'
require 'mongoid'
require_relative '../lib/audit_trail'
require_relative '../apps/api/application'

Hanami.configure do
  mount Api::Application, at: '/'

  environment :development do
    # See: https://guides.hanamirb.org/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []
  end
end
