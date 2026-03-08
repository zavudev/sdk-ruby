# typed: strong

module Zavudev
  module Resources
    class Senders
      class Agent
        class KnowledgeBases
          sig do
            returns(
              Zavudev::Resources::Senders::Agent::KnowledgeBases::Documents
            )
          end
          attr_reader :documents

          # Create a new knowledge base for an agent.
          sig do
            params(
              sender_id: String,
              name: String,
              description: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(
              Zavudev::Models::Senders::Agent::KnowledgeBaseCreateResponse
            )
          end
          def create(sender_id, name:, description: nil, request_options: {})
          end

          # Get a specific knowledge base.
          sig do
            params(
              kb_id: String,
              sender_id: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(
              Zavudev::Models::Senders::Agent::KnowledgeBaseRetrieveResponse
            )
          end
          def retrieve(kb_id, sender_id:, request_options: {})
          end

          # Update a knowledge base.
          sig do
            params(
              kb_id: String,
              sender_id: String,
              description: T.nilable(String),
              name: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(
              Zavudev::Models::Senders::Agent::KnowledgeBaseUpdateResponse
            )
          end
          def update(
            # Path param
            kb_id,
            # Path param
            sender_id:,
            # Body param
            description: nil,
            # Body param
            name: nil,
            request_options: {}
          )
          end

          # List knowledge bases for an agent.
          sig do
            params(
              sender_id: String,
              cursor: String,
              limit: Integer,
              request_options: Zavudev::RequestOptions::OrHash
            ).returns(
              Zavudev::Internal::Cursor[
                Zavudev::Senders::Agent::AgentKnowledgeBase
              ]
            )
          end
          def list(sender_id, cursor: nil, limit: nil, request_options: {})
          end

          # Delete a knowledge base and all its documents.
          sig do
            params(
              kb_id: String,
              sender_id: String,
              request_options: Zavudev::RequestOptions::OrHash
            ).void
          end
          def delete(kb_id, sender_id:, request_options: {})
          end

          # @api private
          sig { params(client: Zavudev::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
