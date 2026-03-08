# typed: strong

module Zavudev
  module Models
    class SenderUploadProfilePictureResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::SenderUploadProfilePictureResponse,
            Zavudev::Internal::AnyHash
          )
        end

      # WhatsApp Business profile information.
      sig { returns(Zavudev::WhatsappBusinessProfile) }
      attr_reader :profile

      sig { params(profile: Zavudev::WhatsappBusinessProfile::OrHash).void }
      attr_writer :profile

      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          profile: Zavudev::WhatsappBusinessProfile::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # WhatsApp Business profile information.
        profile:,
        success:
      )
      end

      sig do
        override.returns(
          { profile: Zavudev::WhatsappBusinessProfile, success: T::Boolean }
        )
      end
      def to_hash
      end
    end
  end
end
