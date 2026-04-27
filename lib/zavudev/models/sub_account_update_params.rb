# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::SubAccounts#update
    class SubAccountUpdateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute credit_limit
      #
      #   @return [Integer, nil]
      optional :credit_limit, Integer, api_name: :creditLimit, nil?: true

      # @!attribute external_id
      #
      #   @return [String, nil]
      optional :external_id, String, api_name: :externalId

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :metadata, Zavudev::Internal::Type::HashOf[Zavudev::Internal::Type::Unknown]

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute status
      #
      #   @return [Symbol, Zavudev::Models::SubAccountUpdateParams::Status, nil]
      optional :status, enum: -> { Zavudev::SubAccountUpdateParams::Status }

      # @!method initialize(id:, credit_limit: nil, external_id: nil, metadata: nil, name: nil, status: nil, request_options: {})
      #   @param id [String]
      #   @param credit_limit [Integer, nil]
      #   @param external_id [String]
      #   @param metadata [Hash{Symbol=>Object}]
      #   @param name [String]
      #   @param status [Symbol, Zavudev::Models::SubAccountUpdateParams::Status]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      module Status
        extend Zavudev::Internal::Type::Enum

        ACTIVE = :active
        INACTIVE = :inactive

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
