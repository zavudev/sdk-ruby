# typed: strong

module Zavudev
  module Models
    module Contacts
      class ChannelUpdateResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::Contacts::ChannelUpdateResponse,
              Zavudev::Internal::AnyHash
            )
          end

        # A communication channel for a contact.
        sig { returns(Zavudev::ContactChannel) }
        attr_reader :channel

        sig { params(channel: Zavudev::ContactChannel::OrHash).void }
        attr_writer :channel

        sig do
          params(channel: Zavudev::ContactChannel::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(
          # A communication channel for a contact.
          channel:
        )
        end

        sig { override.returns({ channel: Zavudev::ContactChannel }) }
        def to_hash
        end
      end
    end
  end
end
