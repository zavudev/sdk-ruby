# frozen_string_literal: true

module Zavudev
  module Models
    module Functions
      # @see Zavudev::Resources::Functions::Secrets#list
      class SecretListResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute secrets
        #
        #   @return [Array<Zavudev::Models::Functions::SecretListResponse::Secret>]
        required :secrets,
                 -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::Functions::SecretListResponse::Secret] }

        # @!method initialize(secrets:)
        #   @param secrets [Array<Zavudev::Models::Functions::SecretListResponse::Secret>]

        class Secret < Zavudev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute key
          #
          #   @return [String]
          required :key, String

          # @!attribute value_last4
          #
          #   @return [String]
          required :value_last4, String, api_name: :valueLast4

          # @!attribute created_at
          #
          #   @return [Float, nil]
          optional :created_at, Float, api_name: :createdAt

          # @!attribute synced_to_aws
          #
          #   @return [Boolean, nil]
          optional :synced_to_aws, Zavudev::Internal::Type::Boolean, api_name: :syncedToAws

          # @!attribute updated_at
          #
          #   @return [Float, nil]
          optional :updated_at, Float, api_name: :updatedAt

          # @!method initialize(id:, key:, value_last4:, created_at: nil, synced_to_aws: nil, updated_at: nil)
          #   @param id [String]
          #   @param key [String]
          #   @param value_last4 [String]
          #   @param created_at [Float]
          #   @param synced_to_aws [Boolean]
          #   @param updated_at [Float]
        end
      end
    end
  end
end
