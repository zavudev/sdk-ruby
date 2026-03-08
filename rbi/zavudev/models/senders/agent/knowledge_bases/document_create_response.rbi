# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        module KnowledgeBases
          class DocumentCreateResponse < Zavudev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Zavudev::Models::Senders::Agent::KnowledgeBases::DocumentCreateResponse,
                  Zavudev::Internal::AnyHash
                )
              end

            sig { returns(Zavudev::Senders::Agent::AgentDocument) }
            attr_reader :document

            sig do
              params(
                document: Zavudev::Senders::Agent::AgentDocument::OrHash
              ).void
            end
            attr_writer :document

            sig do
              params(
                document: Zavudev::Senders::Agent::AgentDocument::OrHash
              ).returns(T.attached_class)
            end
            def self.new(document:)
            end

            sig do
              override.returns(
                { document: Zavudev::Senders::Agent::AgentDocument }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
