# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Senders#get_profile
    class WhatsappBusinessProfileResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute profile
      #   WhatsApp Business profile information.
      #
      #   @return [Zavudev::Models::WhatsappBusinessProfile]
      required :profile, -> { Zavudev::WhatsappBusinessProfile }

      # @!method initialize(profile:)
      #   @param profile [Zavudev::Models::WhatsappBusinessProfile] WhatsApp Business profile information.
    end
  end
end
