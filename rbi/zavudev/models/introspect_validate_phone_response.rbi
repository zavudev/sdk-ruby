# typed: strong

module Zavudev
  module Models
    class IntrospectValidatePhoneResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::IntrospectValidatePhoneResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :country_code

      sig { returns(String) }
      attr_accessor :phone_number

      sig { returns(T::Boolean) }
      attr_accessor :valid_number

      # List of available messaging channels for this phone number.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :available_channels

      sig { params(available_channels: T::Array[String]).void }
      attr_writer :available_channels

      # Carrier information for the phone number.
      sig do
        returns(
          T.nilable(Zavudev::Models::IntrospectValidatePhoneResponse::Carrier)
        )
      end
      attr_reader :carrier

      sig do
        params(
          carrier:
            Zavudev::Models::IntrospectValidatePhoneResponse::Carrier::OrHash
        ).void
      end
      attr_writer :carrier

      # Type of phone line.
      sig { returns(T.nilable(Zavudev::LineType::TaggedSymbol)) }
      attr_reader :line_type

      sig { params(line_type: Zavudev::LineType::OrSymbol).void }
      attr_writer :line_type

      # Phone number in national format.
      sig { returns(T.nilable(String)) }
      attr_reader :national_format

      sig { params(national_format: String).void }
      attr_writer :national_format

      sig do
        params(
          country_code: String,
          phone_number: String,
          valid_number: T::Boolean,
          available_channels: T::Array[String],
          carrier:
            Zavudev::Models::IntrospectValidatePhoneResponse::Carrier::OrHash,
          line_type: Zavudev::LineType::OrSymbol,
          national_format: String
        ).returns(T.attached_class)
      end
      def self.new(
        country_code:,
        phone_number:,
        valid_number:,
        # List of available messaging channels for this phone number.
        available_channels: nil,
        # Carrier information for the phone number.
        carrier: nil,
        # Type of phone line.
        line_type: nil,
        # Phone number in national format.
        national_format: nil
      )
      end

      sig do
        override.returns(
          {
            country_code: String,
            phone_number: String,
            valid_number: T::Boolean,
            available_channels: T::Array[String],
            carrier: Zavudev::Models::IntrospectValidatePhoneResponse::Carrier,
            line_type: Zavudev::LineType::TaggedSymbol,
            national_format: String
          }
        )
      end
      def to_hash
      end

      class Carrier < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::IntrospectValidatePhoneResponse::Carrier,
              Zavudev::Internal::AnyHash
            )
          end

        # Carrier name.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # Type of phone line.
        sig { returns(T.nilable(Zavudev::LineType::TaggedSymbol)) }
        attr_reader :type

        sig { params(type: Zavudev::LineType::OrSymbol).void }
        attr_writer :type

        # Carrier information for the phone number.
        sig do
          params(
            name: T.nilable(String),
            type: Zavudev::LineType::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Carrier name.
          name: nil,
          # Type of phone line.
          type: nil
        )
        end

        sig do
          override.returns(
            { name: T.nilable(String), type: Zavudev::LineType::TaggedSymbol }
          )
        end
        def to_hash
        end
      end
    end
  end
end
