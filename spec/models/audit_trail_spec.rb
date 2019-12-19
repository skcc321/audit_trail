require "spec_helper"

RSpec.describe "audit_target assoc" do
  let!(:target) { create(:audit_target, auditable_id: 1, auditable_type: "SomeType") }
  let!(:child) { create(:audit_target, accociated_id: 1, accociated_type: "SomeType") }

  it "works" do
    expect(target.children).to include(child)
  end
end
