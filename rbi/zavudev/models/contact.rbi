# typed: strong

module Zavudev
  module Models
    class Contact < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Zavudev::Contact, Zavudev::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      # List of available messaging channels for this contact.
      sig { returns(T::Array[String]) }
      attr_accessor :available_channels

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(T::Hash[Symbol, String]) }
      attr_accessor :metadata

      # Whether this contact has been verified.
      sig { returns(T::Boolean) }
      attr_accessor :verified

      # All communication channels for this contact.
      sig { returns(T.nilable(T::Array[Zavudev::ContactChannel])) }
      attr_reader :channels

      sig { params(channels: T::Array[Zavudev::ContactChannel::OrHash]).void }
      attr_writer :channels

      sig { returns(T.nilable(String)) }
      attr_reader :country_code

      sig { params(country_code: String).void }
      attr_writer :country_code

      # Preferred channel for this contact.
      sig { returns(T.nilable(Zavudev::Contact::DefaultChannel::TaggedSymbol)) }
      attr_reader :default_channel

      sig do
        params(default_channel: Zavudev::Contact::DefaultChannel::OrSymbol).void
      end
      attr_writer :default_channel

      # Display name for the contact.
      sig { returns(T.nilable(String)) }
      attr_reader :display_name

      sig { params(display_name: String).void }
      attr_writer :display_name

      # DEPRECATED: Use primaryPhone instead. Primary phone number in E.164 format.
      sig { returns(T.nilable(String)) }
      attr_reader :phone_number

      sig { params(phone_number: String).void }
      attr_writer :phone_number

      # Primary email address.
      sig { returns(T.nilable(String)) }
      attr_reader :primary_email

      sig { params(primary_email: String).void }
      attr_writer :primary_email

      # Primary phone number in E.164 format.
      sig { returns(T.nilable(String)) }
      attr_reader :primary_phone

      sig { params(primary_phone: String).void }
      attr_writer :primary_phone

      # Contact's WhatsApp profile name. Only available for WhatsApp contacts.
      sig { returns(T.nilable(String)) }
      attr_accessor :profile_name

      # ID of a contact suggested for merging.
      sig { returns(T.nilable(String)) }
      attr_reader :suggested_merge_with

      sig { params(suggested_merge_with: String).void }
      attr_writer :suggested_merge_with

      sig { returns(T.nilable(Time)) }
      attr_reader :updated_at

      sig { params(updated_at: Time).void }
      attr_writer :updated_at

      sig do
        params(
          id: String,
          available_channels: T::Array[String],
          created_at: Time,
          metadata: T::Hash[Symbol, String],
          verified: T::Boolean,
          channels: T::Array[Zavudev::ContactChannel::OrHash],
          country_code: String,
          default_channel: Zavudev::Contact::DefaultChannel::OrSymbol,
          display_name: String,
          phone_number: String,
          primary_email: String,
          primary_phone: String,
          profile_name: T.nilable(String),
          suggested_merge_with: String,
          updated_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # List of available messaging channels for this contact.
        available_channels:,
        created_at:,
        metadata:,
        # Whether this contact has been verified.
        verified:,
        # All communication channels for this contact.
        channels: nil,
        country_code: nil,
        # Preferred channel for this contact.
        default_channel: nil,
        # Display name for the contact.
        display_name: nil,
        # DEPRECATED: Use primaryPhone instead. Primary phone number in E.164 format.
        phone_number: nil,
        # Primary email address.
        primary_email: nil,
        # Primary phone number in E.164 format.
        primary_phone: nil,
        # Contact's WhatsApp profile name. Only available for WhatsApp contacts.
        profile_name: nil,
        # ID of a contact suggested for merging.
        suggested_merge_with: nil,
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            available_channels: T::Array[String],
            created_at: Time,
            metadata: T::Hash[Symbol, String],
            verified: T::Boolean,
            channels: T::Array[Zavudev::ContactChannel],
            country_code: String,
            default_channel: Zavudev::Contact::DefaultChannel::TaggedSymbol,
            display_name: String,
            phone_number: String,
            primary_email: String,
            primary_phone: String,
            profile_name: T.nilable(String),
            suggested_merge_with: String,
            updated_at: Time
          }
        )
      end
      def to_hash
      end

      # Preferred channel for this contact.
      module DefaultChannel
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::Contact::DefaultChannel) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SMS = T.let(:sms, Zavudev::Contact::DefaultChannel::TaggedSymbol)
        WHATSAPP =
          T.let(:whatsapp, Zavudev::Contact::DefaultChannel::TaggedSymbol)
        TELEGRAM =
          T.let(:telegram, Zavudev::Contact::DefaultChannel::TaggedSymbol)
        EMAIL = T.let(:email, Zavudev::Contact::DefaultChannel::TaggedSymbol)
        INSTAGRAM =
          T.let(:instagram, Zavudev::Contact::DefaultChannel::TaggedSymbol)
        VOICE = T.let(:voice, Zavudev::Contact::DefaultChannel::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::Contact::DefaultChannel::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
