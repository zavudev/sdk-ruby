# typed: strong

module Zavudev
  module Resources
    class Contacts
      class Channels
        # Update a contact's channel properties.
        sig do
          params(
            channel_id: String,
            contact_id: String,
            label: T.nilable(String),
            metadata: T::Hash[Symbol, String],
            verified: T::Boolean,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Contacts::ChannelUpdateResponse)
        end
        def update(
          # Path param: Channel ID.
          channel_id,
          # Path param
          contact_id:,
          # Body param: Optional label for the channel. Set to null to clear.
          label: nil,
          # Body param
          metadata: nil,
          # Body param: Whether the channel is verified.
          verified: nil,
          request_options: {}
        )
        end

        # Add a new communication channel to an existing contact.
        sig do
          params(
            contact_id: String,
            channel: Zavudev::Contacts::ChannelAddParams::Channel::OrSymbol,
            identifier: String,
            country_code: String,
            is_primary: T::Boolean,
            label: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Contacts::ChannelAddResponse)
        end
        def add(
          contact_id,
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

        # Remove a communication channel from a contact. Cannot remove the last channel.
        sig do
          params(
            channel_id: String,
            contact_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).void
        end
        def remove(
          # Channel ID.
          channel_id,
          contact_id:,
          request_options: {}
        )
        end

        # Set a channel as the primary channel for its type.
        sig do
          params(
            channel_id: String,
            contact_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Contacts::ChannelSetPrimaryResponse)
        end
        def set_primary(
          # Channel ID.
          channel_id,
          contact_id:,
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
