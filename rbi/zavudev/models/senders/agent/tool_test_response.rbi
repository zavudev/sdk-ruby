# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class ToolTestResponse < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Senders::Agent::ToolTestResponse,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(T::Boolean) }
          attr_accessor :scheduled

          sig { params(scheduled: T::Boolean).returns(T.attached_class) }
          def self.new(scheduled:)
          end

          sig { override.returns({ scheduled: T::Boolean }) }
          def to_hash
          end
        end
      end
    end
  end
end
