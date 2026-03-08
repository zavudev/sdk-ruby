# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::PhoneNumbers#update
    class PhoneNumberUpdateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute phone_number_id
      #
      #   @return [String]
      required :phone_number_id, String

      # @!attribute name
      #   Custom name for the phone number. Set to null to clear.
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute sender_id
      #   Sender ID to assign the phone number to. Set to null to unassign.
      #
      #   @return [String, nil]
      optional :sender_id, String, api_name: :senderId, nil?: true

      # @!method initialize(phone_number_id:, name: nil, sender_id: nil, request_options: {})
      #   @param phone_number_id [String]
      #
      #   @param name [String, nil] Custom name for the phone number. Set to null to clear.
      #
      #   @param sender_id [String, nil] Sender ID to assign the phone number to. Set to null to unassign.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
