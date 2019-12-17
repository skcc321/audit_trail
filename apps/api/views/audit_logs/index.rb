module Api
  module Views
    module AuditLogs
      class Index
        include Api::View

        format :json

        def render
          raw JSON.generate(
            audit_targets.map do |audit_target|
              audit_target.attributes
            end
          )
        end
      end
    end
  end
end
