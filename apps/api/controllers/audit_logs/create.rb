module Api
  module Controllers
    module AuditLogs
      class Create
        include Api::Action

        def call(params)
          AuditLog.create(params)
          self.body = "OK"
        end
      end
    end
  end
end
