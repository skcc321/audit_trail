module Api
  module Controllers
    module AuditLogs
      class Index
        include Api::Action

        expose :audit_targets

        params do
          optional(:auditable_id).filled(:int?)
          optional(:auditable_type).filled(:str?)
          optional(:accociated_id).filled(:int?)
          optional(:accociated_type).filled(:str?)
          optional(:action).filled(:str?)
        end

        def call(params)
          self.format = :json

          @audit_targets = AuditTarget.where(params.to_h)
        end
      end
    end
  end
end
