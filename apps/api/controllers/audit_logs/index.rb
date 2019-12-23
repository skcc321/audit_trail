module Api
  module Controllers
    module AuditLogs
      class Index
        include Api::Action

        expose :audit_changes

        params do
          required(:auditable_id).filled(:int?)
          required(:auditable_type).filled(:str?)
          optional(:accociated).each(:str?)
        end

        def initialize(repository = AuditChangeRepository.new)
          @repository = repository
        end

        def call(params)
          if params.valid?
            @audit_changes = @repository.find_with_related(params.to_h)
          else
            self.body = JSON.generate(params.errors)
            self.status = 422
          end
        end
      end
    end
  end
end
