# typed: strong

module Zavudev
  module Models
    module Senders
      class AgentResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::Senders::AgentResponse, Zavudev::Internal::AnyHash)
          end

        # AI Agent configuration for a sender.
        sig { returns(Zavudev::Senders::SendersAgent) }
        attr_reader :agent

        sig { params(agent: Zavudev::Senders::SendersAgent::OrHash).void }
        attr_writer :agent

        sig do
          params(agent: Zavudev::Senders::SendersAgent::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(
          # AI Agent configuration for a sender.
          agent:
        )
        end

        sig { override.returns({ agent: Zavudev::Senders::SendersAgent }) }
        def to_hash
        end
      end
    end
  end
end
