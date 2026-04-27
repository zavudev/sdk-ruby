# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::SubAccounts#create
    class SubAccountCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute name
      #   Name of the sub-account.
      #
      #   @return [String]
      required :name, String

      # @!attribute credit_limit
      #   Spending cap in cents. When reached, messages from this sub-account will be
      #   blocked. Omit or set to 0 for no limit.
      #
      #   @return [Integer, nil]
      optional :credit_limit, Integer, api_name: :creditLimit

      # @!attribute external_id
      #   External reference ID for your own tracking.
      #
      #   @return [String, nil]
      optional :external_id, String, api_name: :externalId

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :metadata, Zavudev::Internal::Type::HashOf[Zavudev::Internal::Type::Unknown]

      # @!method initialize(name:, credit_limit: nil, external_id: nil, metadata: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::SubAccountCreateParams} for more details.
      #
      #   @param name [String] Name of the sub-account.
      #
      #   @param credit_limit [Integer] Spending cap in cents. When reached, messages from this sub-account will be bloc
      #
      #   @param external_id [String] External reference ID for your own tracking.
      #
      #   @param metadata [Hash{Symbol=>Object}]
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
