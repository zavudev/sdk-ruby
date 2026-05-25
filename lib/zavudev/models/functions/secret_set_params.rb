# frozen_string_literal: true

module Zavudev
  module Models
    module Functions
      # @see Zavudev::Resources::Functions::Secrets#set
      class SecretSetParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute function_id
        #
        #   @return [String]
        required :function_id, String

        # @!attribute key
        #
        #   @return [String]
        required :key, String

        # @!attribute value
        #
        #   @return [String]
        required :value, String

        # @!method initialize(function_id:, key:, value:, request_options: {})
        #   @param function_id [String]
        #   @param key [String]
        #   @param value [String]
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
