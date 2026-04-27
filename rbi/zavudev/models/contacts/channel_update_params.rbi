# typed: strong

module Zavudev
  module Models
    module Contacts
      class ChannelUpdateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Contacts::ChannelUpdateParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :contact_id

        sig { returns(String) }
        attr_accessor :channel_id

        # Optional label for the channel. Set to null to clear.
        sig { returns(T.nilable(String)) }
        attr_accessor :label

        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        # Whether the channel is verified.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :verified

        sig { params(verified: T::Boolean).void }
        attr_writer :verified

        sig do
          params(
            contact_id: String,
            channel_id: String,
            label: T.nilable(String),
            metadata: T::Hash[Symbol, String],
            verified: T::Boolean,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          contact_id:,
          channel_id:,
          # Optional label for the channel. Set to null to clear.
          label: nil,
          metadata: nil,
          # Whether the channel is verified.
          verified: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              contact_id: String,
              channel_id: String,
              label: T.nilable(String),
              metadata: T::Hash[Symbol, String],
              verified: T::Boolean,
              request_options: Zavudev::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
