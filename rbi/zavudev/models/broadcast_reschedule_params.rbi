# typed: strong

module Zavudev
  module Models
    class BroadcastRescheduleParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::BroadcastRescheduleParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :broadcast_id

      # New scheduled time for the broadcast.
      sig { returns(Time) }
      attr_accessor :scheduled_at

      sig do
        params(
          broadcast_id: String,
          scheduled_at: Time,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        broadcast_id:,
        # New scheduled time for the broadcast.
        scheduled_at:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            broadcast_id: String,
            scheduled_at: Time,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
