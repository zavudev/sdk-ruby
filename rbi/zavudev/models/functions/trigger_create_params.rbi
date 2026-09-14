# typed: strong

module Zavudev
  module Models
    module Functions
      class TriggerCreateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Functions::TriggerCreateParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :function_id

        # Event types to subscribe to.
        sig { returns(T::Array[String]) }
        attr_accessor :event_types

        # Senders to scope the triggers to. Use null for all senders.
        sig { returns(T::Array[T.nilable(String)]) }
        attr_accessor :sender_ids

        # Required when eventTypes includes `cron`: a 5-field cron expression (minute hour
        # day-of-month month day-of-week), evaluated in UTC.
        sig { returns(T.nilable(String)) }
        attr_reader :cron

        sig { params(cron: String).void }
        attr_writer :cron

        sig do
          params(
            function_id: String,
            event_types: T::Array[String],
            sender_ids: T::Array[T.nilable(String)],
            cron: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          function_id:,
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

        sig do
          override.returns(
            {
              function_id: String,
              event_types: T::Array[String],
              sender_ids: T::Array[T.nilable(String)],
              cron: String,
              request_options: Zavudev::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
