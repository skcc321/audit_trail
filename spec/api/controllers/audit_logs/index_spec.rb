require "spec_helper"

RSpec.describe Api::Controllers::AuditLogs::Index do
  let!(:user) { create(:audit_change, :user) }
  let!(:profile) { create(:audit_change, :profile) }
  let(:format)  { 'application/json' }

  let(:request) { subject.call(params.merge('HTTP_ACCEPT' => format)) }

  describe "#call" do
    context "with valid params" do
      let(:params) {
        {
          auditable_id: user.auditable_id,
          auditable_type: user.auditable_type,
          accociated: ["Profile"],
        }
      }

      before { request }

      it "create audit target" do
        expect(subject.audit_changes).to eq([user, profile])
      end
    end


    context "with invalid params" do
      let(:params) {
        {
          auditable_id: user.auditable_id,
          unknown_attr: user.auditable_type,
        }
      }

      before { request }

      it "return proper error message" do
        expect(request.last).to eq([{ auditable_type: ["is missing"] }.to_json])
      end
    end
  end
end
