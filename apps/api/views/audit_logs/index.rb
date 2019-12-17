module Api
  module Views
    module AuditLogs
      class Index
        include Api::View

        format :json

        def render
          raw JSON.generate(
            items: audit_logs.map do |audit_log|
              audit_log.attributes
            end
          )
        end
      end
    end
  end
end
