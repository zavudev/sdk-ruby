# typed: strong

module Zavudev
  module Resources
    class Contacts
      sig { returns(Zavudev::Resources::Contacts::Channels) }
      attr_reader :channels

      # Create a new contact with one or more communication channels.
      sig do
        params(
          channels: T::Array[Zavudev::ContactCreateParams::Channel::OrHash],
          display_name: String,
          metadata: T::Hash[Symbol, String],
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Contact)
      end
      def create(
        # Communication channels for the contact.
        channels:,
        # Display name for the contact.
        display_name: nil,
        # Arbitrary metadata to associate with the contact.
        metadata: nil,
        request_options: {}
      )
      end

      # Get contact
      sig do
        params(
          contact_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Contact)
      end
      def retrieve(contact_id, request_options: {})
      end

      # Update contact
      sig do
        params(
          contact_id: String,
          default_channel:
            T.nilable(Zavudev::ContactUpdateParams::DefaultChannel::OrSymbol),
          metadata: T::Hash[Symbol, String],
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Contact)
      end
      def update(
        contact_id,
        # Preferred channel for this contact. Set to null to clear.
        default_channel: nil,
        metadata: nil,
        request_options: {}
      )
      end

      # List contacts with their communication channels.
      sig do
        params(
          cursor: String,
          limit: Integer,
          phone_number: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::Contact])
      end
      def list(cursor: nil, limit: nil, phone_number: nil, request_options: {})
      end

      # Dismiss the merge suggestion for a contact.
      sig do
        params(
          contact_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).void
      end
      def dismiss_merge_suggestion(contact_id, request_options: {})
      end

      # Merge a source contact into this contact. All channels from the source contact
      # will be moved to the target contact, and the source contact will be marked as
      # merged.
      sig do
        params(
          contact_id: String,
          source_contact_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Contact)
      end
      def merge(
        contact_id,
        # ID of the contact to merge into the target contact. The source contact will be
        # marked as merged.
        source_contact_id:,
        request_options: {}
      )
      end

      # Get contact by phone number
      sig do
        params(
          phone_number: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Contact)
      end
      def retrieve_by_phone(
        # E.164 phone number.
        phone_number,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
