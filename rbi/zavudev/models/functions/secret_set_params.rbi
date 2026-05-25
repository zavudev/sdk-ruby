# typed: strong

module Zavudev
  module Models
    module Functions
      class SecretSetParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Functions::SecretSetParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :function_id

        sig { returns(String) }
        attr_accessor :key

        sig { returns(String) }
        attr_accessor :value

        sig do
          params(
            function_id: String,
            key: String,
            value: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(function_id:, key:, value:, request_options: {})
        end

        sig do
          override.returns(
            {
              function_id: String,
              key: String,
              value: String,
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
