# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Contacts#list
    class ContactListParams < Zavudev::Internal::Type::BaseModel
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

      # @!attribute phone_number
      #
      #   @return [String, nil]
      optional :phone_number, String

      # @!method initialize(cursor: nil, limit: nil, phone_number: nil, request_options: {})
      #   @param cursor [String]
      #   @param limit [Integer]
      #   @param phone_number [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
