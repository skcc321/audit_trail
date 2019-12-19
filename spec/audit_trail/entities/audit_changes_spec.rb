require "spec_helper"

RSpec.describe "audit_target assoc" do
  let!(:target) { create(:audit_target, auditable_id: 1, auditable_type: "SomeType") }
  let!(:change) { create(:audit_change, audit_target: target) }

  it "works" do
    expect(target.audit_changes).to include(change)
  end
end
