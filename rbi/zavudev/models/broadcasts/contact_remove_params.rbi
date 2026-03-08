# typed: strong

module Zavudev
  module Models
    module Broadcasts
      class ContactRemoveParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Broadcasts::ContactRemoveParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :broadcast_id

        sig { returns(String) }
        attr_accessor :contact_id

        sig do
          params(
            broadcast_id: String,
            contact_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(broadcast_id:, contact_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              broadcast_id: String,
              contact_id: String,
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
