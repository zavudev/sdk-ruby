# frozen_string_literal: true

module Zavudev
  module Models
    module Functions
      # @see Zavudev::Resources::Functions::Triggers#list
      class TriggerListResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute triggers
        #
        #   @return [Array<Zavudev::Models::Functions::TriggerListResponse::Trigger>]
        required :triggers,
                 -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::Functions::TriggerListResponse::Trigger] }

        # @!method initialize(triggers:)
        #   @param triggers [Array<Zavudev::Models::Functions::TriggerListResponse::Trigger>]

        class Trigger < Zavudev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute active
          #
          #   @return [Boolean]
          required :active, Zavudev::Internal::Type::Boolean

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time, api_name: :createdAt

          # @!attribute event_type
          #   Event type that fires the function. See GET /v1/functions/event-types for the
          #   supported list. The special type `cron` fires on a schedule instead of a
          #   messaging event and carries a `cron` expression.
          #
          #   @return [String]
          required :event_type, String, api_name: :eventType

          # @!attribute function_id
          #
          #   @return [String]
          required :function_id, String, api_name: :functionId

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time, api_name: :updatedAt

          # @!attribute cron
          #   5-field cron expression (minute hour day-of-month month day-of-week), evaluated
          #   in UTC. Present only on `cron` triggers.
          #
          #   @return [String, nil]
          optional :cron, String, nil?: true

          # @!attribute last_run_at
          #   Last time the schedule fired. Null until the first fire.
          #
          #   @return [Time, nil]
          optional :last_run_at, Time, api_name: :lastRunAt, nil?: true

          # @!attribute next_run_at
          #   Next scheduled fire time. Present only on `cron` triggers.
          #
          #   @return [Time, nil]
          optional :next_run_at, Time, api_name: :nextRunAt, nil?: true

          # @!attribute sender_id
          #   Restrict the trigger to a single sender. Null means all senders in the project.
          #
          #   @return [String, nil]
          optional :sender_id, String, api_name: :senderId, nil?: true

          # @!method initialize(id:, active:, created_at:, event_type:, function_id:, updated_at:, cron: nil, last_run_at: nil, next_run_at: nil, sender_id: nil)
          #   Some parameter documentations has been truncated, see
          #   {Zavudev::Models::Functions::TriggerListResponse::Trigger} for more details.
          #
          #   A subscription that runs a Zavu Function when a messaging event fires.
          #
          #   @param id [String]
          #
          #   @param active [Boolean]
          #
          #   @param created_at [Time]
          #
          #   @param event_type [String] Event type that fires the function. See GET /v1/functions/event-types for the su
          #
          #   @param function_id [String]
          #
          #   @param updated_at [Time]
          #
          #   @param cron [String, nil] 5-field cron expression (minute hour day-of-month month day-of-week), evaluated
          #
          #   @param last_run_at [Time, nil] Last time the schedule fired. Null until the first fire.
          #
          #   @param next_run_at [Time, nil] Next scheduled fire time. Present only on `cron` triggers.
          #
          #   @param sender_id [String, nil] Restrict the trigger to a single sender. Null means all senders in the project.
        end
      end
    end
  end
end
