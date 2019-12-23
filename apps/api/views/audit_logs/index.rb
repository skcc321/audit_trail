module Api
  module Views
    module AuditLogs
      class Index
        include Api::View

        format :json

        def render
          raw JSON.generate(
            audit_changes.map do |audit_change|
              audit_change.attributes
            end
          )
        end
      end
    end
  end
end
