# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class FlowCreateResponse < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Senders::Agent::FlowCreateResponse,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(Zavudev::Senders::Agent::AgentFlow) }
          attr_reader :flow

          sig { params(flow: Zavudev::Senders::Agent::AgentFlow::OrHash).void }
          attr_writer :flow

          sig do
            params(flow: Zavudev::Senders::Agent::AgentFlow::OrHash).returns(
              T.attached_class
            )
          end
          def self.new(flow:)
          end

          sig { override.returns({ flow: Zavudev::Senders::Agent::AgentFlow }) }
          def to_hash
          end
        end
      end
    end
  end
end
