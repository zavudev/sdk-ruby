# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Invitations#cancel
    class InvitationCancelResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute invitation
      #
      #   @return [Zavudev::Models::Invitation]
      required :invitation, -> { Zavudev::Invitation }

      # @!method initialize(invitation:)
      #   @param invitation [Zavudev::Models::Invitation]
    end
  end
end
