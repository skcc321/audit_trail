# # load Mongoid
Mongoid.load!(File.join(__dir__, "../config/mongoid.yml"), ENV["HANAMI_ENV"])

module AuditTrail
  module Mongoid
    class Repository
      def method_missing(m, *args, &block)
        model_klass.send(m, *args, &block)
      end
    end
  end
end
