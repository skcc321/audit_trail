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

          rule(critheria: [
            :auditable_id,
            :auditable_type,
            :accociated_id,
            :accociated_type
          ]) do |auditable_id, auditable_type, accociated_id, accociated_type|
            (auditable_id.filled? & auditable_type.filled?) |
              (accociated_id.filled? & accociated_type.filled?)
          end
        end

        def initialize(repository = AuditTargetRepository.new)
          @repository = repository
        end

        def call(params)
          self.format = :json

          @audit_targets = @repository.where(params.to_h)
        end
      end
    end
  end
end
