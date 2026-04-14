# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Invitations#list
    class InvitationListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute cursor
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute status
      #   Current status of the partner invitation.
      #
      #   @return [Symbol, Zavudev::Models::InvitationListParams::Status, nil]
      optional :status, enum: -> { Zavudev::InvitationListParams::Status }

      # @!method initialize(cursor: nil, limit: nil, status: nil, request_options: {})
      #   @param cursor [String]
      #
      #   @param limit [Integer]
      #
      #   @param status [Symbol, Zavudev::Models::InvitationListParams::Status] Current status of the partner invitation.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      # Current status of the partner invitation.
      module Status
        extend Zavudev::Internal::Type::Enum

        PENDING = :pending
        IN_PROGRESS = :in_progress
        COMPLETED = :completed
        EXPIRED = :expired
        CANCELLED = :cancelled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
