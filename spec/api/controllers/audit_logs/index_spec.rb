require "spec_helper"

RSpec.describe Api::Controllers::AuditLogs::Index do
  let!(:user) { create(:audit_target, :user) }
  let!(:profile) { create(:audit_target, :profile) }

  let(:request) { subject.call(params) }

  describe "#call" do
    context "with valid params" do
      let(:params) {
        {
          auditable_id: user.auditable_id,
          auditable_type: user.auditable_type,
        }
      }

      before { request }

      it "create audit target" do
        expect(subject.audit_targets).to eq([user])
      end
    end
  end
end
