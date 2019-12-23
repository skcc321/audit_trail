require "spec_helper"

RSpec.describe Api::Controllers::AuditLogs::Create do
  let(:repository) { AuditChangeRepository.new }

  let(:request) { subject.call(params) }

  describe "#call" do
    context "with valid params" do
      let(:params) {
        {
          auditable_type: "User",
          auditable_id: 1,
          action: AuditChange::CREATE_ACTION
        }
      }

      it "creates audit change" do
        expect { request }.to change { repository.count }.by(1)
      end
    end

    context "with invalid params" do
      let(:params) {
        {
          auditable_id: 1,
          action: "invalid"
        }
      }

      it "does not create audit change" do
        expect { request }.to change { repository.count }.by(0)
      end


      it "return error message" do
        expect(request.last).to eq([{auditable_type: ["is missing"], action: ["must be one of: create, update, destroy"] }.to_json])
      end
    end
  end
end
