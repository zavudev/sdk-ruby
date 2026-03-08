# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Senders#upload_profile_picture
    class SenderUploadProfilePictureResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute profile
      #   WhatsApp Business profile information.
      #
      #   @return [Zavudev::Models::WhatsappBusinessProfile]
      required :profile, -> { Zavudev::WhatsappBusinessProfile }

      # @!attribute success
      #
      #   @return [Boolean]
      required :success, Zavudev::Internal::Type::Boolean

      # @!method initialize(profile:, success:)
      #   @param profile [Zavudev::Models::WhatsappBusinessProfile] WhatsApp Business profile information.
      #
      #   @param success [Boolean]
    end
  end
end
