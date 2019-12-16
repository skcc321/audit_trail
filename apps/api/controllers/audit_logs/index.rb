module Api
  module Controllers
    module AuditLogs
      class Index
        include Api::Action

        def call(params)
          self.body = AuditLog.count.to_s
        end
      end
    end
  end
end
