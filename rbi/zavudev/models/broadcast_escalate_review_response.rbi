# typed: strong

module Zavudev
  module Models
    class BroadcastEscalateReviewResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::BroadcastEscalateReviewResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(Zavudev::Broadcast) }
      attr_reader :broadcast

      sig { params(broadcast: Zavudev::Broadcast::OrHash).void }
      attr_writer :broadcast

      sig do
        params(broadcast: Zavudev::Broadcast::OrHash).returns(T.attached_class)
      end
      def self.new(broadcast:)
      end

      sig { override.returns({ broadcast: Zavudev::Broadcast }) }
      def to_hash
      end
    end
  end
end
