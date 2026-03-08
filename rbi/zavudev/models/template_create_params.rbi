# typed: strong

module Zavudev
  module Models
    class TemplateCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::TemplateCreateParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :body

      sig { returns(String) }
      attr_accessor :language

      sig { returns(String) }
      attr_accessor :name

      # Add 'Do not share this code' disclaimer. Only for AUTHENTICATION templates.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :add_security_recommendation

      sig { params(add_security_recommendation: T::Boolean).void }
      attr_writer :add_security_recommendation

      # Template buttons (max 3).
      sig do
        returns(T.nilable(T::Array[Zavudev::TemplateCreateParams::Button]))
      end
      attr_reader :buttons

      sig do
        params(
          buttons: T::Array[Zavudev::TemplateCreateParams::Button::OrHash]
        ).void
      end
      attr_writer :buttons

      # Code expiration time in minutes. Only for AUTHENTICATION templates.
      sig { returns(T.nilable(Integer)) }
      attr_reader :code_expiration_minutes

      sig { params(code_expiration_minutes: Integer).void }
      attr_writer :code_expiration_minutes

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :variables

      sig { params(variables: T::Array[String]).void }
      attr_writer :variables

      # WhatsApp template category.
      sig { returns(T.nilable(Zavudev::WhatsappCategory::OrSymbol)) }
      attr_reader :whatsapp_category

      sig do
        params(whatsapp_category: Zavudev::WhatsappCategory::OrSymbol).void
      end
      attr_writer :whatsapp_category

      sig do
        params(
          body: String,
          language: String,
          name: String,
          add_security_recommendation: T::Boolean,
          buttons: T::Array[Zavudev::TemplateCreateParams::Button::OrHash],
          code_expiration_minutes: Integer,
          variables: T::Array[String],
          whatsapp_category: Zavudev::WhatsappCategory::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        body:,
        language:,
        name:,
        # Add 'Do not share this code' disclaimer. Only for AUTHENTICATION templates.
        add_security_recommendation: nil,
        # Template buttons (max 3).
        buttons: nil,
        # Code expiration time in minutes. Only for AUTHENTICATION templates.
        code_expiration_minutes: nil,
        variables: nil,
        # WhatsApp template category.
        whatsapp_category: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            body: String,
            language: String,
            name: String,
            add_security_recommendation: T::Boolean,
            buttons: T::Array[Zavudev::TemplateCreateParams::Button],
            code_expiration_minutes: Integer,
            variables: T::Array[String],
            whatsapp_category: Zavudev::WhatsappCategory::OrSymbol,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Button < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::TemplateCreateParams::Button,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :text

        sig { returns(Zavudev::TemplateCreateParams::Button::Type::OrSymbol) }
        attr_accessor :type

        # Required when type is 'otp'. COPY_CODE shows copy button, ONE_TAP enables
        # Android autofill.
        sig do
          returns(
            T.nilable(Zavudev::TemplateCreateParams::Button::OtpType::OrSymbol)
          )
        end
        attr_reader :otp_type

        sig do
          params(
            otp_type: Zavudev::TemplateCreateParams::Button::OtpType::OrSymbol
          ).void
        end
        attr_writer :otp_type

        # Android package name. Required for ONE_TAP buttons.
        sig { returns(T.nilable(String)) }
        attr_reader :package_name

        sig { params(package_name: String).void }
        attr_writer :package_name

        sig { returns(T.nilable(String)) }
        attr_reader :phone_number

        sig { params(phone_number: String).void }
        attr_writer :phone_number

        # Android app signature hash. Required for ONE_TAP buttons.
        sig { returns(T.nilable(String)) }
        attr_reader :signature_hash

        sig { params(signature_hash: String).void }
        attr_writer :signature_hash

        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        sig do
          params(
            text: String,
            type: Zavudev::TemplateCreateParams::Button::Type::OrSymbol,
            otp_type: Zavudev::TemplateCreateParams::Button::OtpType::OrSymbol,
            package_name: String,
            phone_number: String,
            signature_hash: String,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          text:,
          type:,
          # Required when type is 'otp'. COPY_CODE shows copy button, ONE_TAP enables
          # Android autofill.
          otp_type: nil,
          # Android package name. Required for ONE_TAP buttons.
          package_name: nil,
          phone_number: nil,
          # Android app signature hash. Required for ONE_TAP buttons.
          signature_hash: nil,
          url: nil
        )
        end

        sig do
          override.returns(
            {
              text: String,
              type: Zavudev::TemplateCreateParams::Button::Type::OrSymbol,
              otp_type:
                Zavudev::TemplateCreateParams::Button::OtpType::OrSymbol,
              package_name: String,
              phone_number: String,
              signature_hash: String,
              url: String
            }
          )
        end
        def to_hash
        end

        module Type
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Zavudev::TemplateCreateParams::Button::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          QUICK_REPLY =
            T.let(
              :quick_reply,
              Zavudev::TemplateCreateParams::Button::Type::TaggedSymbol
            )
          URL =
            T.let(
              :url,
              Zavudev::TemplateCreateParams::Button::Type::TaggedSymbol
            )
          PHONE =
            T.let(
              :phone,
              Zavudev::TemplateCreateParams::Button::Type::TaggedSymbol
            )
          OTP =
            T.let(
              :otp,
              Zavudev::TemplateCreateParams::Button::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::TemplateCreateParams::Button::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Required when type is 'otp'. COPY_CODE shows copy button, ONE_TAP enables
        # Android autofill.
        module OtpType
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Zavudev::TemplateCreateParams::Button::OtpType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COPY_CODE =
            T.let(
              :COPY_CODE,
              Zavudev::TemplateCreateParams::Button::OtpType::TaggedSymbol
            )
          ONE_TAP =
            T.let(
              :ONE_TAP,
              Zavudev::TemplateCreateParams::Button::OtpType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::TemplateCreateParams::Button::OtpType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
