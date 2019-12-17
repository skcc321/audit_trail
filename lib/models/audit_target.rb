class AuditTarget
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  field :auditable_id, type: Integer
  field :auditable_type, type: String

  embeds_many :audit_changes

  # TTL index on the above field.
  index({ u_at: 1 }, { expire_after_seconds: 2.days })
  index({ auditable_id: 1, auditable_type: 1 }, { unique: true })
end
