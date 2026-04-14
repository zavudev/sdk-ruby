# frozen_string_literal: true

module Zavudev
  module Models
    module SubAccounts
      # @see Zavudev::Resources::SubAccounts::APIKeys#revoke
      class APIKeyRevokeParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute key_id
        #
        #   @return [String]
        required :key_id, String

        # @!method initialize(id:, key_id:, request_options: {})
        #   @param id [String]
        #   @param key_id [String]
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
