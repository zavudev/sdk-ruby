# typed: strong

module Zavudev
  module Models
    class InvitationCreateResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::InvitationCreateResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(Zavudev::Invitation) }
      attr_reader :invitation

      sig { params(invitation: Zavudev::Invitation::OrHash).void }
      attr_writer :invitation

      sig do
        params(invitation: Zavudev::Invitation::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(invitation:)
      end

      sig { override.returns({ invitation: Zavudev::Invitation }) }
      def to_hash
      end
    end
  end
end
