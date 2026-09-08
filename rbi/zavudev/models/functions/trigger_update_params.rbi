# typed: strong

module Zavudev
  module Models
    module Functions
      class TriggerUpdateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Functions::TriggerUpdateParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :trigger_id

        sig { returns(T::Boolean) }
        attr_accessor :active

        sig do
          params(
            trigger_id: String,
            active: T::Boolean,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(trigger_id:, active:, request_options: {})
        end

        sig do
          override.returns(
            {
              trigger_id: String,
              active: T::Boolean,
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
