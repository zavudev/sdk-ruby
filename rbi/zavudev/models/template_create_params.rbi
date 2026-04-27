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

      # Default template body. Used when no channel-specific body is set.
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

      # Footer text for the template.
      sig { returns(T.nilable(String)) }
      attr_reader :footer

      sig { params(footer: String).void }
      attr_writer :footer

      # Header content (text string or media URL).
      sig { returns(T.nilable(String)) }
      attr_reader :header_content

      sig { params(header_content: String).void }
      attr_writer :header_content

      # Type of header for the template.
      sig do
        returns(T.nilable(Zavudev::TemplateCreateParams::HeaderType::OrSymbol))
      end
      attr_reader :header_type

      sig do
        params(
          header_type: Zavudev::TemplateCreateParams::HeaderType::OrSymbol
        ).void
      end
      attr_writer :header_type

      # Channel-specific body for Instagram. Falls back to `body` if not set.
      sig { returns(T.nilable(String)) }
      attr_reader :instagram_body

      sig { params(instagram_body: String).void }
      attr_writer :instagram_body

      # Channel-specific body for SMS. Falls back to `body` if not set.
      sig { returns(T.nilable(String)) }
      attr_reader :sms_body

      sig { params(sms_body: String).void }
      attr_writer :sms_body

      # Channel-specific body for Telegram. Falls back to `body` if not set.
      sig { returns(T.nilable(String)) }
      attr_reader :telegram_body

      sig { params(telegram_body: String).void }
      attr_writer :telegram_body

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
          footer: String,
          header_content: String,
          header_type: Zavudev::TemplateCreateParams::HeaderType::OrSymbol,
          instagram_body: String,
          sms_body: String,
          telegram_body: String,
          variables: T::Array[String],
          whatsapp_category: Zavudev::WhatsappCategory::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Default template body. Used when no channel-specific body is set.
        body:,
        language:,
        name:,
        # Add 'Do not share this code' disclaimer. Only for AUTHENTICATION templates.
        add_security_recommendation: nil,
        # Template buttons (max 3).
        buttons: nil,
        # Code expiration time in minutes. Only for AUTHENTICATION templates.
        code_expiration_minutes: nil,
        # Footer text for the template.
        footer: nil,
        # Header content (text string or media URL).
        header_content: nil,
        # Type of header for the template.
        header_type: nil,
        # Channel-specific body for Instagram. Falls back to `body` if not set.
        instagram_body: nil,
        # Channel-specific body for SMS. Falls back to `body` if not set.
        sms_body: nil,
        # Channel-specific body for Telegram. Falls back to `body` if not set.
        telegram_body: nil,
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
            footer: String,
            header_content: String,
            header_type: Zavudev::TemplateCreateParams::HeaderType::OrSymbol,
            instagram_body: String,
            sms_body: String,
            telegram_body: String,
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

        # Sample value Meta uses to review templates with a dynamic URL button.
        # Substituted into `{{1}}` of the URL when the template is submitted to Meta. Only
        # meaningful when `url` contains `{{1}}`; ignored for static URLs.
        sig { returns(T.nilable(String)) }
        attr_reader :example

        sig { params(example: String).void }
        attr_writer :example

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

        # Button destination. Use `{{1}}` exactly once for a dynamic URL (e.g.
        # `https://example.com/orders/{{1}}`); WhatsApp only accepts the strict `{{1}}`
        # form. Static URLs must not contain any `{{...}}` placeholder.
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        sig do
          params(
            text: String,
            type: Zavudev::TemplateCreateParams::Button::Type::OrSymbol,
            example: String,
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
          # Sample value Meta uses to review templates with a dynamic URL button.
          # Substituted into `{{1}}` of the URL when the template is submitted to Meta. Only
          # meaningful when `url` contains `{{1}}`; ignored for static URLs.
          example: nil,
          # Required when type is 'otp'. COPY_CODE shows copy button, ONE_TAP enables
          # Android autofill.
          otp_type: nil,
          # Android package name. Required for ONE_TAP buttons.
          package_name: nil,
          phone_number: nil,
          # Android app signature hash. Required for ONE_TAP buttons.
          signature_hash: nil,
          # Button destination. Use `{{1}}` exactly once for a dynamic URL (e.g.
          # `https://example.com/orders/{{1}}`); WhatsApp only accepts the strict `{{1}}`
          # form. Static URLs must not contain any `{{...}}` placeholder.
          url: nil
        )
        end

        sig do
          override.returns(
            {
              text: String,
              type: Zavudev::TemplateCreateParams::Button::Type::OrSymbol,
              example: String,
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

      # Type of header for the template.
      module HeaderType
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::TemplateCreateParams::HeaderType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TEXT =
          T.let(:text, Zavudev::TemplateCreateParams::HeaderType::TaggedSymbol)
        IMAGE =
          T.let(:image, Zavudev::TemplateCreateParams::HeaderType::TaggedSymbol)
        VIDEO =
          T.let(:video, Zavudev::TemplateCreateParams::HeaderType::TaggedSymbol)
        DOCUMENT =
          T.let(
            :document,
            Zavudev::TemplateCreateParams::HeaderType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Zavudev::TemplateCreateParams::HeaderType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
