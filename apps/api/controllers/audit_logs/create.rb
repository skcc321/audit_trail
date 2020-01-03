module Api
  module Controllers
    module AuditLogs
      class Create
        include Api::Action

        CREATE_ACTION = "create".freeze
        UPDATE_ACTION = "update".freeze
        DESTROY_ACTION = "destroy".freeze

        ACTIONS = [
          CREATE_ACTION,
          UPDATE_ACTION,
          DESTROY_ACTION
        ].freeze

        params do
          required(:items).each do
            schema do
              required(:auditable_id).filled(:int?)
              required(:auditable_type).filled(:str?)

              optional(:accociated_id).filled(:int?)
              optional(:accociated_type).filled(:str?)

              required(:action) { filled? & included_in?(ACTIONS) }

              optional(:changes).maybe(:hash?)

              optional(:ctx).schema do
                optional(:uuid).maybe(:str?)

                optional(:ousr).schema do
                  optional(:id).maybe(:int?)
                  optional(:email).maybe(:str?)
                end
                optional(:usr).schema do
                  optional(:id).maybe(:int?)
                  optional(:email).maybe(:str?)
                end
                optional(:portal).schema do
                  optional(:id).maybe(:int?)
                  optional(:name).maybe(:str?)
                end
                optional(:rmobot).schema do
                  optional(:id).maybe(:int?)
                  optional(:uuid).maybe(:str?)
                  optional(:imei).maybe(:str?)
                end
                optional(:rqst).schema do
                  optional(:ip).maybe(:str?)
                  optional(:tag).maybe(:str?)
                end
                optional(:bkjob).schema do
                  optional(:klass).maybe(:str?)
                  optional(:job)
                end
              end
            end
          end
        end

        def initialize(repository = AuditChangeRepository.new)
          @repository = repository
        end

        def call(params)
          if params.valid?
            # find or create appropriate audit target
            @audit_change = @repository.bulk_create(params.get(:items))

            # Hanami.logger.debug(params.get(:items))
            self.body = JSON.generate(result: "OK")
          else
            # help to debug in development mode
            # Hanami.logger.debug(params.errors)
            self.body = JSON.generate(params.errors)
            self.status = 422
          end
        end
      end
    end
  end
end
