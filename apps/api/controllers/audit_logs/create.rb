module Api
  module Controllers
    module AuditLogs
      class Create
        include Api::Action

        params do
          required(:auditable_id).filled(:int?)
          required(:auditable_type).filled(:str?)
          required(:action) { filled? & included_in?(AuditChange::ACTIONS) }
        end

        def initialize(repository = AuditTargetRepository.new)
          @repository = repository
        end

        def call(params)
          halt 422 unless params.valid?

          # find or create appropriate audit target
          @audit_target = repository.submit_changes(params.to_h)

          self.body = "OK"
        end
      end
    end
  end
end
