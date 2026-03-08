# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Templates#create
    class Template < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute body
      #   Template body with variables: {{1}}, {{2}}, etc.
      #
      #   @return [String]
      required :body, String

      # @!attribute category
      #   WhatsApp template category.
      #
      #   @return [Symbol, Zavudev::Models::WhatsappCategory]
      required :category, enum: -> { Zavudev::WhatsappCategory }

      # @!attribute language
      #   Language code.
      #
      #   @return [String]
      required :language, String

      # @!attribute name
      #   Template name (must match WhatsApp template name).
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
      #   Template buttons.
      #
      #   @return [Array<Zavudev::Models::Template::Button>, nil]
      optional :buttons, -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Template::Button] }

      # @!attribute code_expiration_minutes
      #   Code expiration time in minutes. Only for AUTHENTICATION templates.
      #
      #   @return [Integer, nil]
      optional :code_expiration_minutes, Integer, api_name: :codeExpirationMinutes

      # @!attribute created_at
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute footer
      #   Footer text for the template.
      #
      #   @return [String, nil]
      optional :footer, String

      # @!attribute header_content
      #   Header content (text or media URL).
      #
      #   @return [String, nil]
      optional :header_content, String, api_name: :headerContent

      # @!attribute header_type
      #   Type of header (text, image, video, document).
      #
      #   @return [String, nil]
      optional :header_type, String, api_name: :headerType

      # @!attribute status
      #
      #   @return [Symbol, Zavudev::Models::Template::Status, nil]
      optional :status, enum: -> { Zavudev::Template::Status }

      # @!attribute updated_at
      #
      #   @return [Time, nil]
      optional :updated_at, Time, api_name: :updatedAt

      # @!attribute variables
      #   List of variable names for documentation.
      #
      #   @return [Array<String>, nil]
      optional :variables, Zavudev::Internal::Type::ArrayOf[String]

      # @!attribute whatsapp
      #   WhatsApp-specific template information.
      #
      #   @return [Zavudev::Models::Template::Whatsapp, nil]
      optional :whatsapp, -> { Zavudev::Template::Whatsapp }

      # @!method initialize(id:, body:, category:, language:, name:, add_security_recommendation: nil, buttons: nil, code_expiration_minutes: nil, created_at: nil, footer: nil, header_content: nil, header_type: nil, status: nil, updated_at: nil, variables: nil, whatsapp: nil)
      #   @param id [String]
      #
      #   @param body [String] Template body with variables: {{1}}, {{2}}, etc.
      #
      #   @param category [Symbol, Zavudev::Models::WhatsappCategory] WhatsApp template category.
      #
      #   @param language [String] Language code.
      #
      #   @param name [String] Template name (must match WhatsApp template name).
      #
      #   @param add_security_recommendation [Boolean] Add 'Do not share this code' disclaimer. Only for AUTHENTICATION templates.
      #
      #   @param buttons [Array<Zavudev::Models::Template::Button>] Template buttons.
      #
      #   @param code_expiration_minutes [Integer] Code expiration time in minutes. Only for AUTHENTICATION templates.
      #
      #   @param created_at [Time]
      #
      #   @param footer [String] Footer text for the template.
      #
      #   @param header_content [String] Header content (text or media URL).
      #
      #   @param header_type [String] Type of header (text, image, video, document).
      #
      #   @param status [Symbol, Zavudev::Models::Template::Status]
      #
      #   @param updated_at [Time]
      #
      #   @param variables [Array<String>] List of variable names for documentation.
      #
      #   @param whatsapp [Zavudev::Models::Template::Whatsapp] WhatsApp-specific template information.

      class Button < Zavudev::Internal::Type::BaseModel
        # @!attribute otp_type
        #   OTP button type. Required when type is 'otp'.
        #
        #   @return [Symbol, Zavudev::Models::Template::Button::OtpType, nil]
        optional :otp_type, enum: -> { Zavudev::Template::Button::OtpType }, api_name: :otpType

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

        # @!attribute text
        #
        #   @return [String, nil]
        optional :text, String

        # @!attribute type
        #
        #   @return [Symbol, Zavudev::Models::Template::Button::Type, nil]
        optional :type, enum: -> { Zavudev::Template::Button::Type }

        # @!attribute url
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(otp_type: nil, package_name: nil, phone_number: nil, signature_hash: nil, text: nil, type: nil, url: nil)
        #   @param otp_type [Symbol, Zavudev::Models::Template::Button::OtpType] OTP button type. Required when type is 'otp'.
        #
        #   @param package_name [String] Android package name. Required for ONE_TAP buttons.
        #
        #   @param phone_number [String]
        #
        #   @param signature_hash [String] Android app signature hash. Required for ONE_TAP buttons.
        #
        #   @param text [String]
        #
        #   @param type [Symbol, Zavudev::Models::Template::Button::Type]
        #
        #   @param url [String]

        # OTP button type. Required when type is 'otp'.
        #
        # @see Zavudev::Models::Template::Button#otp_type
        module OtpType
          extend Zavudev::Internal::Type::Enum

          COPY_CODE = :COPY_CODE
          ONE_TAP = :ONE_TAP

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Zavudev::Models::Template::Button#type
        module Type
          extend Zavudev::Internal::Type::Enum

          QUICK_REPLY = :quick_reply
          URL = :url
          PHONE = :phone
          OTP = :otp

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Zavudev::Models::Template#status
      module Status
        extend Zavudev::Internal::Type::Enum

        DRAFT = :draft
        PENDING = :pending
        APPROVED = :approved
        REJECTED = :rejected

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Zavudev::Models::Template#whatsapp
      class Whatsapp < Zavudev::Internal::Type::BaseModel
        # @!attribute namespace
        #   WhatsApp Business Account namespace.
        #
        #   @return [String, nil]
        optional :namespace, String

        # @!attribute status
        #   WhatsApp approval status.
        #
        #   @return [String, nil]
        optional :status, String

        # @!attribute template_name
        #   WhatsApp template name.
        #
        #   @return [String, nil]
        optional :template_name, String, api_name: :templateName

        # @!method initialize(namespace: nil, status: nil, template_name: nil)
        #   WhatsApp-specific template information.
        #
        #   @param namespace [String] WhatsApp Business Account namespace.
        #
        #   @param status [String] WhatsApp approval status.
        #
        #   @param template_name [String] WhatsApp template name.
      end
    end
  end
end
