# frozen_string_literal

class AuditChange
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps::Created::Short

  field :auditable_id, type: Integer
  field :auditable_type, type: String

  field :accociated_id, type: Integer
  field :accociated_type, type: String

  # TTL index on the above field.
  index({ c_at: 1 }, { expire_after_seconds: 2.days })
  index({ auditable_id: 1, auditable_type: 1 })
  index({ accociated_id: 1, accociated_type: 1, auditable_type: 1 })

  # field :action, type: String
#
 #                  :id => 4643365,
 #        :auditable_id => 154254,
 #      :auditable_type => "ShipmentDevice",
 #       :associated_id => 155701,
 #     :associated_type => "Shipment",
 #             :user_id => 2646,
 #           :user_type => "User",
 #            :username => nil,
 #              :action => "create",
 #     :audited_changes => {
 #                       "device_id" => 2058,
 #                     "shipment_id" => 155701,
 #                          "status" => "active",
 #                       "placement" => "cargo",
 #                          "source" => 1,
 #               "rmo_assignment_id" => nil,
 #         "destination_location_id" => nil,
 #             "shipment_segment_id" => nil,
 #                         "details" => {}
 #     },
 #             :version => 1,
 #             :comment => nil,
 #      :remote_address => "70.123.58.241",
 #        :request_uuid => "ad1adedb-1f95-4c6e-a6cf-a04e314df717",
 #          :created_at => Wed, 11 Dec 2019 10:18:56 UTC +00:00
end
