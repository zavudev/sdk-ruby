# typed: strong

module Zavudev
  module Models
    module Contacts
      class ChannelAddParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Contacts::ChannelAddParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :contact_id

        # Channel type.
        sig { returns(Zavudev::Contacts::ChannelAddParams::Channel::OrSymbol) }
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

        sig do
          params(
            contact_id: String,
            channel: Zavudev::Contacts::ChannelAddParams::Channel::OrSymbol,
            identifier: String,
            country_code: String,
            is_primary: T::Boolean,
            label: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          contact_id:,
          # Channel type.
          channel:,
          # Channel identifier (phone number in E.164 format or email address).
          identifier:,
          # ISO country code for phone numbers.
          country_code: nil,
          # Whether this should be the primary channel for its type.
          is_primary: nil,
          # Optional label for the channel.
          label: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              contact_id: String,
              channel: Zavudev::Contacts::ChannelAddParams::Channel::OrSymbol,
              identifier: String,
              country_code: String,
              is_primary: T::Boolean,
              label: String,
              request_options: Zavudev::RequestOptions
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
              T.all(Symbol, Zavudev::Contacts::ChannelAddParams::Channel)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SMS =
            T.let(
              :sms,
              Zavudev::Contacts::ChannelAddParams::Channel::TaggedSymbol
            )
          WHATSAPP =
            T.let(
              :whatsapp,
              Zavudev::Contacts::ChannelAddParams::Channel::TaggedSymbol
            )
          EMAIL =
            T.let(
              :email,
              Zavudev::Contacts::ChannelAddParams::Channel::TaggedSymbol
            )
          TELEGRAM =
            T.let(
              :telegram,
              Zavudev::Contacts::ChannelAddParams::Channel::TaggedSymbol
            )
          VOICE =
            T.let(
              :voice,
              Zavudev::Contacts::ChannelAddParams::Channel::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Contacts::ChannelAddParams::Channel::TaggedSymbol
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
