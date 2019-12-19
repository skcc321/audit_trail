FactoryBot.define do
  factory :audit_change do
    audit_target { AuditTargetRepository.new }

    initialize_with do
      AuditChangeRepository.new.new(attributes)
    end
  end
end
