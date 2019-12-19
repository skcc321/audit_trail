FactoryBot.define do
  factory :audit_target do
    auditable_id { 1 }
    auditable_type { "Profile" }
    accociated_id { 1 }
    accociated_type { "User" }

    trait :user do
      auditable_type { "User" }
      auditable_id { 1 }
    end

    trait :profile do
      auditable_type { "Profile" }
      auditable_id { 1 }
      accociated_type { "User" }
      accociated_id { 1 }
    end


    initialize_with do
      AuditTargetRepository.new.new(attributes)
    end
  end
end
