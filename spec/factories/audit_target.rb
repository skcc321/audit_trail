FactoryBot.define do
  factory :audit_target do
    auditable_id { 1 }
    auditable_type { "Profile" }
    accociated_id { 1 }
    accociated_type { "User" }
  end
end
