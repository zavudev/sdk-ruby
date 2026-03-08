# typed: strong

module Zavudev
  module Resources
    class Contacts
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
