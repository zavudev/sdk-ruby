# typed: strong

module Zavudev
  module Resources
    class Broadcasts
      class Contacts
        # List contacts in a broadcast with optional status filter.
        sig do
          params(
            broadcast_id: String,
            cursor: String,
            limit: Integer,
            status: Zavudev::BroadcastContactStatus::OrSymbol,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Internal::Cursor[Zavudev::BroadcastContact])
        end
        def list(
          broadcast_id,
          cursor: nil,
          limit: nil,
          # Status of a contact within a broadcast.
          status: nil,
          request_options: {}
        )
        end

        # Add contacts to a broadcast in batch. Maximum 1000 contacts per request.
        sig do
          params(
            broadcast_id: String,
            contacts:
              T::Array[Zavudev::Broadcasts::ContactAddParams::Contact::OrHash],
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Broadcasts::ContactAddResponse)
        end
        def add(
          broadcast_id,
          # List of contacts to add (max 1000 per request).
          contacts:,
          request_options: {}
        )
        end

        # Remove a contact from a broadcast in draft status.
        sig do
          params(
            contact_id: String,
            broadcast_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).void
        end
        def remove(
          # Broadcast contact ID (not the global contact ID)
          contact_id,
          broadcast_id:,
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
end
