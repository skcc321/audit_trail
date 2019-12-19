FactoryBot.define do
  factory :audit_target do
    auditable_id { 1 }
    auditable_type { "Profile" }
    accociated_id { 1 }
    accociated_type { "User" }


    initialize_with do
      AuditTargetRepository.new.new(attributes)
    end
  end
end
