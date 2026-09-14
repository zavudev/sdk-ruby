# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::PhoneNumbers#purchase
    class PhoneNumberPurchaseParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute phone_number
      #   Phone number in E.164 format.
      #
      #   @return [String]
      required :phone_number, String, api_name: :phoneNumber

      # @!attribute name
      #   Optional custom name for the phone number.
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute regulatory_requirements
      #   Regulatory information, for numbers whose requirements list is not empty. Get
      #   the list with `GET /v1/phone-numbers/requirements?phoneNumber=...` and send one
      #   entry per requirement id, except `action` requirements, which take no value.
      #   Every required id must be present, once, and no unknown id may be sent;
      #   otherwise the purchase is refused with `400 invalid_request` before anything is
      #   charged.
      #
      #   The information is kept for your project under the number's country and `type`.
      #   A later purchase there may omit this field if what is kept still covers that
      #   number's requirements. Omit it for numbers without requirements.
      #
      #   @return [Array<Zavudev::Models::PhoneNumberPurchaseParams::RegulatoryRequirement>, nil]
      optional :regulatory_requirements,
               -> {
                 Zavudev::Internal::Type::ArrayOf[Zavudev::PhoneNumberPurchaseParams::RegulatoryRequirement]
               },
               api_name: :regulatoryRequirements

      # @!attribute type
      #   Type of phone number. `mobile` is stocked in countries where no geographic
      #   (`local`) or non-geographic (`national`) inventory exists, and in several
      #   markets it is the only type that can receive SMS.
      #
      #   @return [Symbol, Zavudev::Models::PhoneNumberType, nil]
      optional :type, enum: -> { Zavudev::PhoneNumberType }

      # @!method initialize(phone_number:, name: nil, regulatory_requirements: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::PhoneNumberPurchaseParams} for more details.
      #
      #   @param phone_number [String] Phone number in E.164 format.
      #
      #   @param name [String] Optional custom name for the phone number.
      #
      #   @param regulatory_requirements [Array<Zavudev::Models::PhoneNumberPurchaseParams::RegulatoryRequirement>] Regulatory information, for numbers whose requirements list is not empty. Get th
      #
      #   @param type [Symbol, Zavudev::Models::PhoneNumberType] Type of phone number. `mobile` is stocked in countries where no geographic (`loc
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      class RegulatoryRequirement < Zavudev::Internal::Type::BaseModel
        # @!attribute field_value
        #   Depends on the requirement's `type`: the text itself for `textual`; for
        #   `address`, the `id` of an address created in this project with
        #   `POST /v1/addresses`; for `document`, the `id` of a document created with
        #   `POST /v1/documents`. An address or document from another project, or one
        #   rejected in review, is refused.
        #
        #   @return [String]
        required :field_value, String, api_name: :fieldValue

        # @!attribute requirement_type
        #   A `requirementTypes[].id` from `GET /v1/phone-numbers/requirements`. Each id may
        #   appear only once.
        #
        #   @return [String]
        required :requirement_type, String, api_name: :requirementType

        # @!method initialize(field_value:, requirement_type:)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::PhoneNumberPurchaseParams::RegulatoryRequirement} for more
        #   details.
        #
        #   @param field_value [String] Depends on the requirement's `type`: the text itself for `textual`; for `address
        #
        #   @param requirement_type [String] A `requirementTypes[].id` from `GET /v1/phone-numbers/requirements`. Each id may
      end
    end
  end
end
