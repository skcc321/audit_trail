require "hanami/validations"
require "hanami/controller"

module Api
  module Controllers
    module AuditLogs
      class Create
        include Api::Action

        params do
          required(:auditable_id).filled(:int?)
          required(:logo).filled(:int?)
          required(:auditable_type).filled(:str?)
        end

        def call(params)
          halt 422 unless params.valid?

          AuditLog.create(params.to_hash)
          self.body = "OK"
        end
      end
    end
  end
end
