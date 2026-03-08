# typed: strong

module Zavudev
  module Models
    class ContactUpdateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::ContactUpdateParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :contact_id

      # Preferred channel for this contact. Set to null to clear.
      sig do
        returns(
          T.nilable(Zavudev::ContactUpdateParams::DefaultChannel::OrSymbol)
        )
      end
      attr_accessor :default_channel

      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      sig do
        params(
          contact_id: String,
          default_channel:
            T.nilable(Zavudev::ContactUpdateParams::DefaultChannel::OrSymbol),
          metadata: T::Hash[Symbol, String],
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        contact_id:,
        # Preferred channel for this contact. Set to null to clear.
        default_channel: nil,
        metadata: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            contact_id: String,
            default_channel:
              T.nilable(Zavudev::ContactUpdateParams::DefaultChannel::OrSymbol),
            metadata: T::Hash[Symbol, String],
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Preferred channel for this contact. Set to null to clear.
      module DefaultChannel
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Zavudev::ContactUpdateParams::DefaultChannel)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SMS =
          T.let(
            :sms,
            Zavudev::ContactUpdateParams::DefaultChannel::TaggedSymbol
          )
        WHATSAPP =
          T.let(
            :whatsapp,
            Zavudev::ContactUpdateParams::DefaultChannel::TaggedSymbol
          )
        TELEGRAM =
          T.let(
            :telegram,
            Zavudev::ContactUpdateParams::DefaultChannel::TaggedSymbol
          )
        EMAIL =
          T.let(
            :email,
            Zavudev::ContactUpdateParams::DefaultChannel::TaggedSymbol
          )
        INSTAGRAM =
          T.let(
            :instagram,
            Zavudev::ContactUpdateParams::DefaultChannel::TaggedSymbol
          )
        VOICE =
          T.let(
            :voice,
            Zavudev::ContactUpdateParams::DefaultChannel::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Zavudev::ContactUpdateParams::DefaultChannel::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
