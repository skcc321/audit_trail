require "spec_helper"

RSpec.describe AuditChange do
  it "works" do
    expect {
      create(:audit_change, auditable_id: 1, auditable_type: "SomeType")
    }.to change { AuditChangeRepository.new.count }.by(1)
  end
end
