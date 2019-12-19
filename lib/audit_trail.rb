# # load Mongoid
Mongoid.load!(File.join(__dir__, "../config/mongoid.yml"), ENV["HANAMI_ENV"])

module AuditTrail
  module Mongoid
    class Repository
      def entity_klass
        Object.const_get(self.class.name.gsub("Repository", ""))
      end

      def method_missing(m, *args, &block)
        entity_klass.send(m, *args, &block)
      end
    end
  end
end
