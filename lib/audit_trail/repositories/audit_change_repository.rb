class AuditChangeRepository < AuditTrail::Mongoid::Repository
  def find_with_related(params)
    accociated = [params[:auditable_type], *Array(params[:accociated])]

    entity_klass.or(
      {
        auditable_id: params[:auditable_id],
        auditable_type: params[:auditable_type],
      },
      {
        accociated_id: params[:auditable_id],
        accociated_type: params[:auditable_type],
        auditable_type: { "$in": accociated }
      }
    )
  end
end
