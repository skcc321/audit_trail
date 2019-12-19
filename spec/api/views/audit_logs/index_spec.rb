require "spec_helper"

RSpec.describe Api::Views::AuditLogs::Index do
  let(:audit_target_attrs) {
    Hash[auditable_id: 1, auditable_type: "User"]
  }

  let(:exposures) {
    Hash[audit_targets: [double('AuditTarget', attributes: audit_target_attrs)], params: {}]
  }

  let(:template) { Hanami::View::Template.new('apps/api/templates/application.json.erb') }
  let(:view) { described_class.new(template, exposures) }
  let(:rendered) { view.render }

  it "renders audit_targets as json" do
    expect(rendered).to eq([audit_target_attrs].to_json)
  end
end
