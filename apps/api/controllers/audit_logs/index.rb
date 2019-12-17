module Api
  module Controllers
    module AuditLogs
      class Index
        include Api::Action

        expose :audit_logs

        def call(params)
          self.format = :json

          @audit_logs = AuditLog.all
        end
      end
    end
  end
end
