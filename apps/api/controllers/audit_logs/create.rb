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

        def initialize(repository = AuditChangeRepository.new)
          @repository = repository
        end

        def call(params)
          if params.valid?
            # find or create appropriate audit target
            @audit_change = @repository.create(params.to_h)

            self.body = JSON.generate(result: "OK")
          else
            self.body = JSON.generate(params.errors)
            self.status = 422
          end
        end
      end
    end
  end
end
