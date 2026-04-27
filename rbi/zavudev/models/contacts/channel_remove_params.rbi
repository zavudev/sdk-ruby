# typed: strong

module Zavudev
  module Models
    module Contacts
      class ChannelRemoveParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Contacts::ChannelRemoveParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :contact_id

        sig { returns(String) }
        attr_accessor :channel_id

        sig do
          params(
            contact_id: String,
            channel_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(contact_id:, channel_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              contact_id: String,
              channel_id: String,
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
