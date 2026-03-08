# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Contacts#retrieve
    class ContactRetrieveParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute contact_id
      #
      #   @return [String]
      required :contact_id, String

      # @!method initialize(contact_id:, request_options: {})
      #   @param contact_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
