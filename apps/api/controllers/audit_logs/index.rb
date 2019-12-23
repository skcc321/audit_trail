module Api
  module Controllers
    module AuditLogs
      class Index
        include Api::Action

        expose :audit_changes

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

        def initialize(repository = AuditChangeRepository.new)
          @repository = repository
        end

        def call(params)
          if params.valid?
            @audit_changes = @repository.where(params.to_h)
          else
            self.body = JSON.generate(params.errors)
            self.status = 422
          end
        end
      end
    end
  end
end
