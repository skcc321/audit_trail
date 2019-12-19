require "spec_helper"

RSpec.describe "audit_target assoc" do
  let!(:target) { AuditTarget.create(auditable_id: 1, auditable_type: "SomeType") }
  let!(:child) { AuditTarget.create(accociated_id: 1, accociated_type: "SomeType") }

  it "works" do
    expect(target.children).to include(child)
  end
end
