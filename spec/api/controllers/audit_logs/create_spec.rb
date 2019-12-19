require "spec_helper"

RSpec.describe Api::Controllers::AuditLogs::Create do
  let(:user_audit_params) {
    {
      auditable_type: "User",
      auditable_id: 1,
      action: AuditChange::CREATE_ACTION
    }
  }

  let(:profile_audit_params) {
    {
      auditable_type: "Profile",
      auditable_id: 1,
      accociated_type: "User",
      accociated_id: 1,
      action: AuditChange::CREATE_ACTION
    }
  }

  describe "#call" do
    context "with valid params" do
      it "create audit target" do
        expect {
          subject.call(user_audit_params)
        }.to change { AuditTarget.count }.by(1)
        #
        # binding.pry
        # subject.call(profile_audit_params)
      end
    end
  end
end
