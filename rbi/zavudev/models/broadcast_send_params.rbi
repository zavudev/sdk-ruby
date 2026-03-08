# typed: strong

module Zavudev
  module Models
    class BroadcastSendParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::BroadcastSendParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :broadcast_id

      # Schedule for future delivery. Omit to send immediately.
      sig { returns(T.nilable(Time)) }
      attr_reader :scheduled_at

      sig { params(scheduled_at: Time).void }
      attr_writer :scheduled_at

      sig do
        params(
          broadcast_id: String,
          scheduled_at: Time,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        broadcast_id:,
        # Schedule for future delivery. Omit to send immediately.
        scheduled_at: nil,
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
