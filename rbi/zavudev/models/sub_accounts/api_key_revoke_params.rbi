# typed: strong

module Zavudev
  module Models
    module SubAccounts
      class APIKeyRevokeParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::SubAccounts::APIKeyRevokeParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :key_id

        sig do
          params(
            id: String,
            key_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(id:, key_id:, request_options: {})
        end

        sig do
          override.returns(
            {
              id: String,
              key_id: String,
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
