# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        class KnowledgeBaseUpdateResponse < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Senders::Agent::KnowledgeBaseUpdateResponse,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(Zavudev::Senders::Agent::AgentKnowledgeBase) }
          attr_reader :knowledge_base

          sig do
            params(
              knowledge_base:
                Zavudev::Senders::Agent::AgentKnowledgeBase::OrHash
            ).void
          end
          attr_writer :knowledge_base

          sig do
            params(
              knowledge_base:
                Zavudev::Senders::Agent::AgentKnowledgeBase::OrHash
            ).returns(T.attached_class)
          end
          def self.new(knowledge_base:)
          end

          sig do
            override.returns(
              { knowledge_base: Zavudev::Senders::Agent::AgentKnowledgeBase }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
