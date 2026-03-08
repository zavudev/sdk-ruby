# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::RegulatoryDocuments#list
    class RegulatoryDocumentListParams < Zavudev::Internal::Type::BaseModel
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

      # @!method initialize(cursor: nil, limit: nil, request_options: {})
      #   @param cursor [String]
      #   @param limit [Integer]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
