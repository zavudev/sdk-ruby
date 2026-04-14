# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::SubAccounts#list
    class SubAccount < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute status
      #
      #   @return [Symbol, Zavudev::Models::SubAccount::Status]
      required :status, enum: -> { Zavudev::SubAccount::Status }

      # @!attribute total_spent
      #   Total amount spent by this sub-account in cents.
      #
      #   @return [Integer]
      required :total_spent, Integer, api_name: :totalSpent

      # @!attribute api_key
      #   API key for the sub-account. Only returned on creation.
      #
      #   @return [String, nil]
      optional :api_key, String, api_name: :apiKey

      # @!attribute credit_limit
      #   Spending cap in cents. When reached, messages from this sub-account will be
      #   blocked.
      #
      #   @return [Integer, nil]
      optional :credit_limit, Integer, api_name: :creditLimit, nil?: true

      # @!attribute external_id
      #   External reference ID set by the parent account.
      #
      #   @return [String, nil]
      optional :external_id, String, api_name: :externalId, nil?: true

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :metadata, Zavudev::Internal::Type::HashOf[Zavudev::Internal::Type::Unknown], nil?: true

      # @!method initialize(id:, created_at:, name:, status:, total_spent:, api_key: nil, credit_limit: nil, external_id: nil, metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::SubAccount} for more details.
      #
      #   @param id [String]
      #
      #   @param created_at [Time]
      #
      #   @param name [String]
      #
      #   @param status [Symbol, Zavudev::Models::SubAccount::Status]
      #
      #   @param total_spent [Integer] Total amount spent by this sub-account in cents.
      #
      #   @param api_key [String] API key for the sub-account. Only returned on creation.
      #
      #   @param credit_limit [Integer, nil] Spending cap in cents. When reached, messages from this sub-account will be bloc
      #
      #   @param external_id [String, nil] External reference ID set by the parent account.
      #
      #   @param metadata [Hash{Symbol=>Object}, nil]

      # @see Zavudev::Models::SubAccount#status
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
