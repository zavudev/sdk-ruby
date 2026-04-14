# frozen_string_literal: true

module Zavudev
  module Models
    module SubAccounts
      # @see Zavudev::Resources::SubAccounts::APIKeys#create
      class APIKeyCreateResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute api_key
        #
        #   @return [Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey]
        required :api_key, -> { Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey }, api_name: :apiKey

        # @!method initialize(api_key:)
        #   @param api_key [Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey]

        # @see Zavudev::Models::SubAccounts::APIKeyCreateResponse#api_key
        class APIKey < Zavudev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute environment
          #
          #   @return [Symbol, Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey::Environment]
          required :environment,
                   enum: -> { Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey::Environment }

          # @!attribute key
          #
          #   @return [String]
          required :key, String

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!method initialize(id:, environment:, key:, name:)
          #   @param id [String]
          #   @param environment [Symbol, Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey::Environment]
          #   @param key [String]
          #   @param name [String]

          # @see Zavudev::Models::SubAccounts::APIKeyCreateResponse::APIKey#environment
          module Environment
            extend Zavudev::Internal::Type::Enum

            LIVE = :live
            TEST = :test

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
