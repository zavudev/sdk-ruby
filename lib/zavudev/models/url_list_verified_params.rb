# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::URLs#list_verified
    class URLListVerifiedParams < Zavudev::Internal::Type::BaseModel
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
      #   Filter by verification status.
      #
      #   @return [Symbol, Zavudev::Models::URLListVerifiedParams::Status, nil]
      optional :status, enum: -> { Zavudev::URLListVerifiedParams::Status }

      # @!method initialize(cursor: nil, limit: nil, status: nil, request_options: {})
      #   @param cursor [String]
      #
      #   @param limit [Integer]
      #
      #   @param status [Symbol, Zavudev::Models::URLListVerifiedParams::Status] Filter by verification status.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      # Filter by verification status.
      module Status
        extend Zavudev::Internal::Type::Enum

        PENDING = :pending
        APPROVED = :approved
        REJECTED = :rejected
        MALICIOUS = :malicious

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
