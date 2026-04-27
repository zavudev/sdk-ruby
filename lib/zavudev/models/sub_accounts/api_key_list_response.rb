# frozen_string_literal: true

module Zavudev
  module Models
    module SubAccounts
      # @see Zavudev::Resources::SubAccounts::APIKeys#list
      class APIKeyListResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute items
        #
        #   @return [Array<Zavudev::Models::SubAccounts::APIKeyListResponse::Item>]
        required :items,
                 -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::SubAccounts::APIKeyListResponse::Item] }

        # @!method initialize(items:)
        #   @param items [Array<Zavudev::Models::SubAccounts::APIKeyListResponse::Item>]

        class Item < Zavudev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #
          #   @return [Float]
          required :created_at, Float, api_name: :createdAt

          # @!attribute environment
          #
          #   @return [Symbol, Zavudev::Models::SubAccounts::APIKeyListResponse::Item::Environment]
          required :environment, enum: -> { Zavudev::Models::SubAccounts::APIKeyListResponse::Item::Environment }

          # @!attribute key_prefix
          #   First characters of the key for identification.
          #
          #   @return [String]
          required :key_prefix, String, api_name: :keyPrefix

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute key
          #   Full API key. Only returned on creation.
          #
          #   @return [String, nil]
          optional :key, String

          # @!attribute last_used_at
          #
          #   @return [Float, nil]
          optional :last_used_at, Float, api_name: :lastUsedAt, nil?: true

          # @!attribute permissions
          #
          #   @return [Array<String>, nil]
          optional :permissions, Zavudev::Internal::Type::ArrayOf[String]

          # @!attribute revoked_at
          #
          #   @return [Float, nil]
          optional :revoked_at, Float, api_name: :revokedAt, nil?: true

          # @!method initialize(id:, created_at:, environment:, key_prefix:, name:, key: nil, last_used_at: nil, permissions: nil, revoked_at: nil)
          #   @param id [String]
          #
          #   @param created_at [Float]
          #
          #   @param environment [Symbol, Zavudev::Models::SubAccounts::APIKeyListResponse::Item::Environment]
          #
          #   @param key_prefix [String] First characters of the key for identification.
          #
          #   @param name [String]
          #
          #   @param key [String] Full API key. Only returned on creation.
          #
          #   @param last_used_at [Float, nil]
          #
          #   @param permissions [Array<String>]
          #
          #   @param revoked_at [Float, nil]

          # @see Zavudev::Models::SubAccounts::APIKeyListResponse::Item#environment
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
