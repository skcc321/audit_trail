class AuditTargetRepository < AuditTrail::Mongoid::Repository
  def submit_changes(attrs)
    # find or create appropriate audit target
    audit_target = create_with(
      accociated_id: attrs[:accociated_id],
      accociated_type: attrs[:accociated_type]
    ).find_or_create_by(
      auditable_id: attrs[:auditable_id],
      auditable_type: attrs[:auditable_type]
    )

    change_attrs = attrs.except(:auditable_id, :auditable_type)

    # create audit change for it
    audit_target.audit_changes.create(change_attrs)

    audit_target
  end
end
