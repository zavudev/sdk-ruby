# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Introspect#validate_phone
    class IntrospectValidatePhoneResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute country_code
      #
      #   @return [String]
      required :country_code, String, api_name: :countryCode

      # @!attribute phone_number
      #
      #   @return [String]
      required :phone_number, String, api_name: :phoneNumber

      # @!attribute valid_number
      #
      #   @return [Boolean]
      required :valid_number, Zavudev::Internal::Type::Boolean, api_name: :validNumber

      # @!attribute available_channels
      #   List of available messaging channels for this phone number.
      #
      #   @return [Array<String>, nil]
      optional :available_channels, Zavudev::Internal::Type::ArrayOf[String], api_name: :availableChannels

      # @!attribute carrier
      #   Carrier information for the phone number.
      #
      #   @return [Zavudev::Models::IntrospectValidatePhoneResponse::Carrier, nil]
      optional :carrier, -> { Zavudev::Models::IntrospectValidatePhoneResponse::Carrier }

      # @!attribute line_type
      #   Type of phone line.
      #
      #   @return [Symbol, Zavudev::Models::LineType, nil]
      optional :line_type, enum: -> { Zavudev::LineType }, api_name: :lineType

      # @!attribute national_format
      #   Phone number in national format.
      #
      #   @return [String, nil]
      optional :national_format, String, api_name: :nationalFormat

      # @!method initialize(country_code:, phone_number:, valid_number:, available_channels: nil, carrier: nil, line_type: nil, national_format: nil)
      #   @param country_code [String]
      #
      #   @param phone_number [String]
      #
      #   @param valid_number [Boolean]
      #
      #   @param available_channels [Array<String>] List of available messaging channels for this phone number.
      #
      #   @param carrier [Zavudev::Models::IntrospectValidatePhoneResponse::Carrier] Carrier information for the phone number.
      #
      #   @param line_type [Symbol, Zavudev::Models::LineType] Type of phone line.
      #
      #   @param national_format [String] Phone number in national format.

      # @see Zavudev::Models::IntrospectValidatePhoneResponse#carrier
      class Carrier < Zavudev::Internal::Type::BaseModel
        # @!attribute name
        #   Carrier name.
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute type
        #   Type of phone line.
        #
        #   @return [Symbol, Zavudev::Models::LineType, nil]
        optional :type, enum: -> { Zavudev::LineType }

        # @!method initialize(name: nil, type: nil)
        #   Carrier information for the phone number.
        #
        #   @param name [String, nil] Carrier name.
        #
        #   @param type [Symbol, Zavudev::Models::LineType] Type of phone line.
      end
    end
  end
end
