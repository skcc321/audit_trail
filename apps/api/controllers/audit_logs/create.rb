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

        def call(params)
          halt 422 unless params.valid?

          # find or create appropriate audit target
          audit_target = AuditTarget.create_with(
            accociated_id: params[:accociated_id],
            accociated_type: params[:accociated_type]
          ).find_or_create_by(
            auditable_id: params[:auditable_id],
            auditable_type: params[:auditable_type]
          )

          attrs = params.to_hash.except(:auditable_id, :auditable_type)

          # create audit change for it
          audit_target.audit_changes.create(attrs)

          self.body = "OK"
        end
      end
    end
  end
end
