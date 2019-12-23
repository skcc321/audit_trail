require "spec_helper"

RSpec.describe Api::Views::AuditLogs::Index do
  let(:audit_change_attrs) {
    Hash[auditable_id: 1, accociated_type: "User"]
  }

  let(:exposures) {
    Hash[audit_changes: [double('AuditChange', attributes: audit_change_attrs)], params: {}]
  }

  let(:template) { Hanami::View::Template.new('apps/api/templates/application.json.erb') }
  let(:view) { described_class.new(template, exposures) }
  let(:rendered) { view.render }

  it "renders audit_targets as json" do
    expect(rendered).to eq([audit_change_attrs].to_json)
  end
end
