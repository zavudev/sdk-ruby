# typed: strong

module Zavudev
  module Resources
    class Functions
      class Triggers
        # Subscribe a function to one or more event types, optionally scoped to specific
        # senders. Provide eventTypes and senderIds (use null in senderIds for all
        # senders); a trigger is created for each event type and sender combination.
        #
        # The special event type `cron` runs the function on a schedule instead of a
        # messaging event: include a `cron` field with a 5-field UTC cron expression
        # (minimum granularity one minute). A cron trigger ignores the sender axis, and a
        # function may hold several cron triggers with different expressions. The function
        # receives an event with `type: "cron"` and `data.cron`.
        sig do
          params(
            function_id: String,
            event_types: T::Array[String],
            sender_ids: T::Array[T.nilable(String)],
            cron: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Functions::TriggerCreateResponse)
        end
        def create(
          # Zavu Function ID.
          function_id,
          # Event types to subscribe to.
          event_types:,
          # Senders to scope the triggers to. Use null for all senders.
          sender_ids:,
          # Required when eventTypes includes `cron`: a 5-field cron expression (minute hour
          # day-of-month month day-of-week), evaluated in UTC.
          cron: nil,
          request_options: {}
        )
        end

        # Enable or disable a trigger
        sig do
          params(
            trigger_id: String,
            active: T::Boolean,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Functions::TriggerUpdateResponse)
        end
        def update(trigger_id, active:, request_options: {})
        end

        # List function triggers
        sig do
          params(
            function_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Functions::TriggerListResponse)
        end
        def list(
          # Zavu Function ID.
          function_id,
          request_options: {}
        )
        end

        # Delete a trigger
        sig do
          params(
            trigger_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).void
        end
        def delete(trigger_id, request_options: {})
        end

        # @api private
        sig { params(client: Zavudev::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
