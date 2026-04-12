# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Templates#create
    class TemplateCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute body
      #   Default template body. Used when no channel-specific body is set.
      #
      #   @return [String]
      required :body, String

      # @!attribute language
      #
      #   @return [String]
      required :language, String

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute add_security_recommendation
      #   Add 'Do not share this code' disclaimer. Only for AUTHENTICATION templates.
      #
      #   @return [Boolean, nil]
      optional :add_security_recommendation,
               Zavudev::Internal::Type::Boolean,
               api_name: :addSecurityRecommendation

      # @!attribute buttons
      #   Template buttons (max 3).
      #
      #   @return [Array<Zavudev::Models::TemplateCreateParams::Button>, nil]
      optional :buttons, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::TemplateCreateParams::Button] }

      # @!attribute code_expiration_minutes
      #   Code expiration time in minutes. Only for AUTHENTICATION templates.
      #
      #   @return [Integer, nil]
      optional :code_expiration_minutes, Integer, api_name: :codeExpirationMinutes

      # @!attribute instagram_body
      #   Channel-specific body for Instagram. Falls back to `body` if not set.
      #
      #   @return [String, nil]
      optional :instagram_body, String, api_name: :instagramBody

      # @!attribute sms_body
      #   Channel-specific body for SMS. Falls back to `body` if not set.
      #
      #   @return [String, nil]
      optional :sms_body, String, api_name: :smsBody

      # @!attribute telegram_body
      #   Channel-specific body for Telegram. Falls back to `body` if not set.
      #
      #   @return [String, nil]
      optional :telegram_body, String, api_name: :telegramBody

      # @!attribute variables
      #
      #   @return [Array<String>, nil]
      optional :variables, Zavudev::Internal::Type::ArrayOf[String]

      # @!attribute whatsapp_category
      #   WhatsApp template category.
      #
      #   @return [Symbol, Zavudev::Models::WhatsappCategory, nil]
      optional :whatsapp_category, enum: -> { Zavudev::WhatsappCategory }, api_name: :whatsappCategory

      # @!method initialize(body:, language:, name:, add_security_recommendation: nil, buttons: nil, code_expiration_minutes: nil, instagram_body: nil, sms_body: nil, telegram_body: nil, variables: nil, whatsapp_category: nil, request_options: {})
      #   @param body [String] Default template body. Used when no channel-specific body is set.
      #
      #   @param language [String]
      #
      #   @param name [String]
      #
      #   @param add_security_recommendation [Boolean] Add 'Do not share this code' disclaimer. Only for AUTHENTICATION templates.
      #
      #   @param buttons [Array<Zavudev::Models::TemplateCreateParams::Button>] Template buttons (max 3).
      #
      #   @param code_expiration_minutes [Integer] Code expiration time in minutes. Only for AUTHENTICATION templates.
      #
      #   @param instagram_body [String] Channel-specific body for Instagram. Falls back to `body` if not set.
      #
      #   @param sms_body [String] Channel-specific body for SMS. Falls back to `body` if not set.
      #
      #   @param telegram_body [String] Channel-specific body for Telegram. Falls back to `body` if not set.
      #
      #   @param variables [Array<String>]
      #
      #   @param whatsapp_category [Symbol, Zavudev::Models::WhatsappCategory] WhatsApp template category.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      class Button < Zavudev::Internal::Type::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, Zavudev::Models::TemplateCreateParams::Button::Type]
        required :type, enum: -> { Zavudev::TemplateCreateParams::Button::Type }

        # @!attribute otp_type
        #   Required when type is 'otp'. COPY_CODE shows copy button, ONE_TAP enables
        #   Android autofill.
        #
        #   @return [Symbol, Zavudev::Models::TemplateCreateParams::Button::OtpType, nil]
        optional :otp_type, enum: -> { Zavudev::TemplateCreateParams::Button::OtpType }, api_name: :otpType

        # @!attribute package_name
        #   Android package name. Required for ONE_TAP buttons.
        #
        #   @return [String, nil]
        optional :package_name, String, api_name: :packageName

        # @!attribute phone_number
        #
        #   @return [String, nil]
        optional :phone_number, String, api_name: :phoneNumber

        # @!attribute signature_hash
        #   Android app signature hash. Required for ONE_TAP buttons.
        #
        #   @return [String, nil]
        optional :signature_hash, String, api_name: :signatureHash

        # @!attribute url
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(text:, type:, otp_type: nil, package_name: nil, phone_number: nil, signature_hash: nil, url: nil)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::TemplateCreateParams::Button} for more details.
        #
        #   @param text [String]
        #
        #   @param type [Symbol, Zavudev::Models::TemplateCreateParams::Button::Type]
        #
        #   @param otp_type [Symbol, Zavudev::Models::TemplateCreateParams::Button::OtpType] Required when type is 'otp'. COPY_CODE shows copy button, ONE_TAP enables Androi
        #
        #   @param package_name [String] Android package name. Required for ONE_TAP buttons.
        #
        #   @param phone_number [String]
        #
        #   @param signature_hash [String] Android app signature hash. Required for ONE_TAP buttons.
        #
        #   @param url [String]

        # @see Zavudev::Models::TemplateCreateParams::Button#type
        module Type
          extend Zavudev::Internal::Type::Enum

          QUICK_REPLY = :quick_reply
          URL = :url
          PHONE = :phone
          OTP = :otp

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Required when type is 'otp'. COPY_CODE shows copy button, ONE_TAP enables
        # Android autofill.
        #
        # @see Zavudev::Models::TemplateCreateParams::Button#otp_type
        module OtpType
          extend Zavudev::Internal::Type::Enum

          COPY_CODE = :COPY_CODE
          ONE_TAP = :ONE_TAP

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
