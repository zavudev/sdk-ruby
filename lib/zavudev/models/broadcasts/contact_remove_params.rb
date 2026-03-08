# frozen_string_literal: true

module Zavudev
  module Models
    module Broadcasts
      # @see Zavudev::Resources::Broadcasts::Contacts#remove
      class ContactRemoveParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute broadcast_id
        #
        #   @return [String]
        required :broadcast_id, String

        # @!attribute contact_id
        #
        #   @return [String]
        required :contact_id, String

        # @!method initialize(broadcast_id:, contact_id:, request_options: {})
        #   @param broadcast_id [String]
        #   @param contact_id [String]
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
