# typed: strong

module Zavudev
  module Models
    module Functions
      class TriggerUpdateResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::Functions::TriggerUpdateResponse,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :active

        sig { returns(T::Boolean) }
        attr_accessor :ok

        sig do
          params(active: T::Boolean, ok: T::Boolean).returns(T.attached_class)
        end
        def self.new(active:, ok:)
        end

        sig { override.returns({ active: T::Boolean, ok: T::Boolean }) }
        def to_hash
        end
      end
    end
  end
end
