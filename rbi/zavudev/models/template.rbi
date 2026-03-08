# typed: strong

module Zavudev
  module Models
    class Template < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Zavudev::Template, Zavudev::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      # Template body with variables: {{1}}, {{2}}, etc.
      sig { returns(String) }
      attr_accessor :body

      # WhatsApp template category.
      sig { returns(Zavudev::WhatsappCategory::TaggedSymbol) }
      attr_accessor :category

      # Language code.
      sig { returns(String) }
      attr_accessor :language

      # Template name (must match WhatsApp template name).
      sig { returns(String) }
      attr_accessor :name

      # Add 'Do not share this code' disclaimer. Only for AUTHENTICATION templates.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :add_security_recommendation

      sig { params(add_security_recommendation: T::Boolean).void }
      attr_writer :add_security_recommendation

      # Template buttons.
      sig { returns(T.nilable(T::Array[Zavudev::Template::Button])) }
      attr_reader :buttons

      sig { params(buttons: T::Array[Zavudev::Template::Button::OrHash]).void }
      attr_writer :buttons

      # Code expiration time in minutes. Only for AUTHENTICATION templates.
      sig { returns(T.nilable(Integer)) }
      attr_reader :code_expiration_minutes

      sig { params(code_expiration_minutes: Integer).void }
      attr_writer :code_expiration_minutes

      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # Footer text for the template.
      sig { returns(T.nilable(String)) }
      attr_reader :footer

      sig { params(footer: String).void }
      attr_writer :footer

      # Header content (text or media URL).
      sig { returns(T.nilable(String)) }
      attr_reader :header_content

      sig { params(header_content: String).void }
      attr_writer :header_content

      # Type of header (text, image, video, document).
      sig { returns(T.nilable(String)) }
      attr_reader :header_type

      sig { params(header_type: String).void }
      attr_writer :header_type

      sig { returns(T.nilable(Zavudev::Template::Status::TaggedSymbol)) }
      attr_reader :status

      sig { params(status: Zavudev::Template::Status::OrSymbol).void }
      attr_writer :status

      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      # List of variable names for documentation.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :variables

      sig { params(variables: T::Array[String]).void }
      attr_writer :variables

      # WhatsApp-specific template information.
      sig { returns(T.nilable(Zavudev::Template::Whatsapp)) }
      attr_reader :whatsapp

      sig { params(whatsapp: Zavudev::Template::Whatsapp::OrHash).void }
      attr_writer :whatsapp

      sig do
        params(
          id: String,
          body: String,
          category: Zavudev::WhatsappCategory::OrSymbol,
          language: String,
          name: String,
          add_security_recommendation: T::Boolean,
          buttons: T::Array[Zavudev::Template::Button::OrHash],
          code_expiration_minutes: Integer,
          created_at: Time,
          footer: String,
          header_content: String,
          header_type: String,
          status: Zavudev::Template::Status::OrSymbol,
          updated_at: Time,
          variables: T::Array[String],
          whatsapp: Zavudev::Template::Whatsapp::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Template body with variables: {{1}}, {{2}}, etc.
        body:,
        # WhatsApp template category.
        category:,
        # Language code.
        language:,
        # Template name (must match WhatsApp template name).
        name:,
        # Add 'Do not share this code' disclaimer. Only for AUTHENTICATION templates.
        add_security_recommendation: nil,
        # Template buttons.
        buttons: nil,
        # Code expiration time in minutes. Only for AUTHENTICATION templates.
        code_expiration_minutes: nil,
        created_at: nil,
        # Footer text for the template.
        footer: nil,
        # Header content (text or media URL).
        header_content: nil,
        # Type of header (text, image, video, document).
        header_type: nil,
        status: nil,
        updated_at: nil,
        # List of variable names for documentation.
        variables: nil,
        # WhatsApp-specific template information.
        whatsapp: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            body: String,
            category: Zavudev::WhatsappCategory::TaggedSymbol,
            language: String,
            name: String,
            add_security_recommendation: T::Boolean,
            buttons: T::Array[Zavudev::Template::Button],
            code_expiration_minutes: Integer,
            created_at: Time,
            footer: String,
            header_content: String,
            header_type: String,
            status: Zavudev::Template::Status::TaggedSymbol,
            updated_at: Time,
            variables: T::Array[String],
            whatsapp: Zavudev::Template::Whatsapp
          }
        )
      end
      def to_hash
      end

      class Button < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::Template::Button, Zavudev::Internal::AnyHash)
          end

        # OTP button type. Required when type is 'otp'.
        sig do
          returns(T.nilable(Zavudev::Template::Button::OtpType::TaggedSymbol))
        end
        attr_reader :otp_type

        sig do
          params(otp_type: Zavudev::Template::Button::OtpType::OrSymbol).void
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
        attr_reader :text

        sig { params(text: String).void }
        attr_writer :text

        sig do
          returns(T.nilable(Zavudev::Template::Button::Type::TaggedSymbol))
        end
        attr_reader :type

        sig { params(type: Zavudev::Template::Button::Type::OrSymbol).void }
        attr_writer :type

        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        sig do
          params(
            otp_type: Zavudev::Template::Button::OtpType::OrSymbol,
            package_name: String,
            phone_number: String,
            signature_hash: String,
            text: String,
            type: Zavudev::Template::Button::Type::OrSymbol,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # OTP button type. Required when type is 'otp'.
          otp_type: nil,
          # Android package name. Required for ONE_TAP buttons.
          package_name: nil,
          phone_number: nil,
          # Android app signature hash. Required for ONE_TAP buttons.
          signature_hash: nil,
          text: nil,
          type: nil,
          url: nil
        )
        end

        sig do
          override.returns(
            {
              otp_type: Zavudev::Template::Button::OtpType::TaggedSymbol,
              package_name: String,
              phone_number: String,
              signature_hash: String,
              text: String,
              type: Zavudev::Template::Button::Type::TaggedSymbol,
              url: String
            }
          )
        end
        def to_hash
        end

        # OTP button type. Required when type is 'otp'.
        module OtpType
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Zavudev::Template::Button::OtpType) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COPY_CODE =
            T.let(:COPY_CODE, Zavudev::Template::Button::OtpType::TaggedSymbol)
          ONE_TAP =
            T.let(:ONE_TAP, Zavudev::Template::Button::OtpType::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Zavudev::Template::Button::OtpType::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        module Type
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Zavudev::Template::Button::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          QUICK_REPLY =
            T.let(:quick_reply, Zavudev::Template::Button::Type::TaggedSymbol)
          URL = T.let(:url, Zavudev::Template::Button::Type::TaggedSymbol)
          PHONE = T.let(:phone, Zavudev::Template::Button::Type::TaggedSymbol)
          OTP = T.let(:otp, Zavudev::Template::Button::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Zavudev::Template::Button::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      module Status
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Zavudev::Template::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DRAFT = T.let(:draft, Zavudev::Template::Status::TaggedSymbol)
        PENDING = T.let(:pending, Zavudev::Template::Status::TaggedSymbol)
        APPROVED = T.let(:approved, Zavudev::Template::Status::TaggedSymbol)
        REJECTED = T.let(:rejected, Zavudev::Template::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Zavudev::Template::Status::TaggedSymbol])
        end
        def self.values
        end
      end

      class Whatsapp < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::Template::Whatsapp, Zavudev::Internal::AnyHash)
          end

        # WhatsApp Business Account namespace.
        sig { returns(T.nilable(String)) }
        attr_reader :namespace

        sig { params(namespace: String).void }
        attr_writer :namespace

        # WhatsApp approval status.
        sig { returns(T.nilable(String)) }
        attr_reader :status

        sig { params(status: String).void }
        attr_writer :status

        # WhatsApp template name.
        sig { returns(T.nilable(String)) }
        attr_reader :template_name

        sig { params(template_name: String).void }
        attr_writer :template_name

        # WhatsApp-specific template information.
        sig do
          params(
            namespace: String,
            status: String,
            template_name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # WhatsApp Business Account namespace.
          namespace: nil,
          # WhatsApp approval status.
          status: nil,
          # WhatsApp template name.
          template_name: nil
        )
        end

        sig do
          override.returns(
            { namespace: String, status: String, template_name: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
