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
          display_name: T.nilable(String),
          metadata: T::Hash[Symbol, String],
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Contact)
      end
      def update(
        contact_id,
        # Preferred channel for this contact. Set to null to clear.
        default_channel: nil,
        # Human-readable name for this contact. Set to null to clear it and fall back to
        # the contact's identifier. Contacts created automatically from an inbound message
        # have no display name until you set one.
        display_name: nil,
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
          search: String,
          tag: T::Array[String],
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::Contact])
      end
      def list(
        # Opaque cursor from a previous response's `nextCursor`. Do not construct it.
        cursor: nil,
        limit: nil,
        # Exact match on the contact's primary phone number, in E.164.
        phone_number: nil,
        # Free-text match over the contact's name (`displayName` and the WhatsApp profile
        # name), phone numbers and email addresses. Case- and accent-insensitive. A phone
        # number matches on a trailing fragment too, so `5551234` finds `+14155551234`.
        #
        # Contacts created automatically from an inbound message have no `displayName` —
        # they are matched by their identifier until you set one with
        # `PATCH /v1/contacts/{contactId}`.
        #
        # Results come back in relevance order rather than newest-first. `cursor` is
        # opaque in both modes; pass back exactly what the previous response returned, and
        # start a new pagination run when the search term changes.
        search: nil,
        # Tag name. Repeatable: `?tag=vip&tag=chile` returns contacts carrying **every**
        # tag given, not any of them — the same rule the dashboard filter applies.
        #
        # Tags are matched by name, case-insensitively. An unknown tag returns 400 rather
        # than being ignored, because a typo that silently matched every contact would be
        # a worse answer than an error.
        tag: nil,
        request_options: {}
      )
      end

      # Permanently delete a contact and its communication channels. Implements
      # right-to-erasure obligations under GDPR Art. 17, Ley 19.628 (Chile) Art. 12,
      # CCPA § 1798.105, and LGPD Art. 18.VI. The contact, its channels, and any
      # associated agent flow sessions and conversation threads are removed. Past
      # message records and broadcast delivery logs are retained for billing/audit but
      # no longer reference the deleted contact.
      sig do
        params(
          contact_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).void
      end
      def delete(contact_id, request_options: {})
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
