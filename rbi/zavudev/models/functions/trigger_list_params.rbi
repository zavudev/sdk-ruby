# typed: strong

module Zavudev
  module Models
    module Functions
      class TriggerListParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Functions::TriggerListParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :function_id

        sig do
          params(
            function_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(function_id:, request_options: {})
        end

        sig do
          override.returns(
            { function_id: String, request_options: Zavudev::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
