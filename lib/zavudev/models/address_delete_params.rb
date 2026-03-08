# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Addresses#delete
    class AddressDeleteParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute address_id
      #
      #   @return [String]
      required :address_id, String

      # @!method initialize(address_id:, request_options: {})
      #   @param address_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
