class AuditTarget
  include Mongoid::Document
  include Mongoid::Timestamps::Short

  field :auditable_id, type: Integer
  field :auditable_type, type: String

  field :accociated_id, type: Integer
  field :accociated_type, type: String

  embeds_many :audit_changes

  # TTL index on the above field.
  index({ u_at: 1 }, { expire_after_seconds: 2.days })
  index({ auditable_id: 1, auditable_type: 1 }, { unique: true })
  index({ accociated_id: 1, accociated_type: 1 }, { unique: true })

  # move that to repository
  def parent
    AuditTarget.find_by(auditable_id: accociated_id, auditable_type: accociated_type)
  end

  def children
    AuditTarget.where(accociated_id: auditable_id, accociated_type: auditable_type)
  end
end
