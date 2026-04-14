# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Invitations#cancel
    class InvitationCancelParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute invitation_id
      #
      #   @return [String]
      required :invitation_id, String

      # @!method initialize(invitation_id:, request_options: {})
      #   @param invitation_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
