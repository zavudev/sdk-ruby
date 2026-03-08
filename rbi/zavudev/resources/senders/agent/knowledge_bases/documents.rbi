# typed: strong

module Zavudev
  module Resources
    class Senders
      class Agent
        class KnowledgeBases
          class Documents
            # Add a document to a knowledge base. The document will be automatically processed
            # for RAG.
            sig do
              params(
                kb_id: String,
                sender_id: String,
                content: String,
                title: String,
                request_options: Zavudev::RequestOptions::OrHash
              ).returns(
                Zavudev::Models::Senders::Agent::KnowledgeBases::DocumentCreateResponse
              )
            end
            def create(
              # Path param
              kb_id,
              # Path param
              sender_id:,
              # Body param
              content:,
              # Body param
              title:,
              request_options: {}
            )
            end

            # List documents in a knowledge base.
            sig do
              params(
                kb_id: String,
                sender_id: String,
                cursor: String,
                limit: Integer,
                request_options: Zavudev::RequestOptions::OrHash
              ).returns(
                Zavudev::Internal::Cursor[
                  Zavudev::Senders::Agent::AgentDocument
                ]
              )
            end
            def list(
              # Path param
              kb_id,
              # Path param
              sender_id:,
              # Query param
              cursor: nil,
              # Query param
              limit: nil,
              request_options: {}
            )
            end

            # Delete a document from a knowledge base.
            sig do
              params(
                doc_id: String,
                sender_id: String,
                kb_id: String,
                request_options: Zavudev::RequestOptions::OrHash
              ).void
            end
            def delete(doc_id, sender_id:, kb_id:, request_options: {})
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
end
