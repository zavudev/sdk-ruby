# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Invitations#create
    class InvitationCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute allowed_phone_countries
      #   ISO country codes for allowed phone numbers.
      #
      #   @return [Array<String>, nil]
      optional :allowed_phone_countries,
               Zavudev::Internal::Type::ArrayOf[String],
               api_name: :allowedPhoneCountries

      # @!attribute client_email
      #   Email of the client being invited.
      #
      #   @return [String, nil]
      optional :client_email, String, api_name: :clientEmail

      # @!attribute client_name
      #   Name of the client being invited.
      #
      #   @return [String, nil]
      optional :client_name, String, api_name: :clientName

      # @!attribute client_phone
      #   Phone number of the client in E.164 format.
      #
      #   @return [String, nil]
      optional :client_phone, String, api_name: :clientPhone

      # @!attribute expires_in_days
      #   Number of days until the invitation expires.
      #
      #   @return [Integer, nil]
      optional :expires_in_days, Integer, api_name: :expiresInDays

      # @!attribute phone_number_id
      #   ID of a Zavu phone number to pre-assign for WhatsApp registration. If provided,
      #   the client will use this number instead of their own.
      #
      #   @return [String, nil]
      optional :phone_number_id, String, api_name: :phoneNumberId

      # @!method initialize(allowed_phone_countries: nil, client_email: nil, client_name: nil, client_phone: nil, expires_in_days: nil, phone_number_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::InvitationCreateParams} for more details.
      #
      #   @param allowed_phone_countries [Array<String>] ISO country codes for allowed phone numbers.
      #
      #   @param client_email [String] Email of the client being invited.
      #
      #   @param client_name [String] Name of the client being invited.
      #
      #   @param client_phone [String] Phone number of the client in E.164 format.
      #
      #   @param expires_in_days [Integer] Number of days until the invitation expires.
      #
      #   @param phone_number_id [String] ID of a Zavu phone number to pre-assign for WhatsApp registration. If provided,
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
