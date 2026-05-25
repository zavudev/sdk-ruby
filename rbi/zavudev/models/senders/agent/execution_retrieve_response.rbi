# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class ExecutionRetrieveResponse < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Senders::Agent::ExecutionRetrieveResponse,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(Zavudev::Senders::AgentExecution) }
          attr_reader :execution

          sig do
            params(execution: Zavudev::Senders::AgentExecution::OrHash).void
          end
          attr_writer :execution

          sig do
            params(execution: Zavudev::Senders::AgentExecution::OrHash).returns(
              T.attached_class
            )
          end
          def self.new(execution:)
          end

          sig do
            override.returns({ execution: Zavudev::Senders::AgentExecution })
          end
          def to_hash
          end
        end
      end
    end
  end
end
