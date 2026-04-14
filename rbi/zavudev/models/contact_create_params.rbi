# typed: strong

module Zavudev
  module Models
    class ContactCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::ContactCreateParams, Zavudev::Internal::AnyHash)
        end

      # Communication channels for the contact.
      sig { returns(T::Array[Zavudev::ContactCreateParams::Channel]) }
      attr_accessor :channels

      # Display name for the contact.
      sig { returns(T.nilable(String)) }
      attr_reader :display_name

      sig { params(display_name: String).void }
      attr_writer :display_name

      # Arbitrary metadata to associate with the contact.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      sig do
        params(
          channels: T::Array[Zavudev::ContactCreateParams::Channel::OrHash],
          display_name: String,
          metadata: T::Hash[Symbol, String],
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Communication channels for the contact.
        channels:,
        # Display name for the contact.
        display_name: nil,
        # Arbitrary metadata to associate with the contact.
        metadata: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            channels: T::Array[Zavudev::ContactCreateParams::Channel],
            display_name: String,
            metadata: T::Hash[Symbol, String],
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Channel < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::ContactCreateParams::Channel,
              Zavudev::Internal::AnyHash
            )
          end

        # Channel type.
        sig do
          returns(Zavudev::ContactCreateParams::Channel::Channel::OrSymbol)
        end
        attr_accessor :channel

        # Channel identifier (phone number in E.164 format or email address).
        sig { returns(String) }
        attr_accessor :identifier

        # ISO country code for phone numbers.
        sig { returns(T.nilable(String)) }
        attr_reader :country_code

        sig { params(country_code: String).void }
        attr_writer :country_code

        # Whether this should be the primary channel for its type.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_primary

        sig { params(is_primary: T::Boolean).void }
        attr_writer :is_primary

        # Optional label for the channel.
        sig { returns(T.nilable(String)) }
        attr_reader :label

        sig { params(label: String).void }
        attr_writer :label

        # Input for creating a contact channel.
        sig do
          params(
            channel: Zavudev::ContactCreateParams::Channel::Channel::OrSymbol,
            identifier: String,
            country_code: String,
            is_primary: T::Boolean,
            label: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Channel type.
          channel:,
          # Channel identifier (phone number in E.164 format or email address).
          identifier:,
          # ISO country code for phone numbers.
          country_code: nil,
          # Whether this should be the primary channel for its type.
          is_primary: nil,
          # Optional label for the channel.
          label: nil
        )
        end

        sig do
          override.returns(
            {
              channel: Zavudev::ContactCreateParams::Channel::Channel::OrSymbol,
              identifier: String,
              country_code: String,
              is_primary: T::Boolean,
              label: String
            }
          )
        end
        def to_hash
        end

        # Channel type.
        module Channel
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Zavudev::ContactCreateParams::Channel::Channel)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SMS =
            T.let(
              :sms,
              Zavudev::ContactCreateParams::Channel::Channel::TaggedSymbol
            )
          WHATSAPP =
            T.let(
              :whatsapp,
              Zavudev::ContactCreateParams::Channel::Channel::TaggedSymbol
            )
          EMAIL =
            T.let(
              :email,
              Zavudev::ContactCreateParams::Channel::Channel::TaggedSymbol
            )
          TELEGRAM =
            T.let(
              :telegram,
              Zavudev::ContactCreateParams::Channel::Channel::TaggedSymbol
            )
          VOICE =
            T.let(
              :voice,
              Zavudev::ContactCreateParams::Channel::Channel::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::ContactCreateParams::Channel::Channel::TaggedSymbol
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
