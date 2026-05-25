# typed: strong

module Zavudev
  module Models
    class FunctionTailLogsResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::FunctionTailLogsResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig do
        returns(T::Array[Zavudev::Models::FunctionTailLogsResponse::Event])
      end
      attr_accessor :events

      # Pass to the next request to fetch the following page of logs.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_token

      sig do
        params(
          events:
            T::Array[Zavudev::Models::FunctionTailLogsResponse::Event::OrHash],
          next_token: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        events:,
        # Pass to the next request to fetch the following page of logs.
        next_token: nil
      )
      end

      sig do
        override.returns(
          {
            events: T::Array[Zavudev::Models::FunctionTailLogsResponse::Event],
            next_token: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Event < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::FunctionTailLogsResponse::Event,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :message

        sig { returns(Time) }
        attr_accessor :timestamp

        sig do
          params(message: String, timestamp: Time).returns(T.attached_class)
        end
        def self.new(message:, timestamp:)
        end

        sig { override.returns({ message: String, timestamp: Time }) }
        def to_hash
        end
      end
    end
  end
end
