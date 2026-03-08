# frozen_string_literal: true

module Zavudev
  module Resources
    class Senders
      class Agent
        class KnowledgeBases
          class Documents
            # Add a document to a knowledge base. The document will be automatically processed
            # for RAG.
            #
            # @overload create(kb_id, sender_id:, content:, title:, request_options: {})
            #
            # @param kb_id [String] Path param
            #
            # @param sender_id [String] Path param
            #
            # @param content [String] Body param
            #
            # @param title [String] Body param
            #
            # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Zavudev::Models::Senders::Agent::KnowledgeBases::DocumentCreateResponse]
            #
            # @see Zavudev::Models::Senders::Agent::KnowledgeBases::DocumentCreateParams
            def create(kb_id, params)
              parsed, options = Zavudev::Senders::Agent::KnowledgeBases::DocumentCreateParams.dump_request(params)
              sender_id =
                parsed.delete(:sender_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :post,
                path: ["v1/senders/%1$s/agent/knowledge-bases/%2$s/documents", sender_id, kb_id],
                body: parsed,
                model: Zavudev::Models::Senders::Agent::KnowledgeBases::DocumentCreateResponse,
                options: options
              )
            end

            # List documents in a knowledge base.
            #
            # @overload list(kb_id, sender_id:, cursor: nil, limit: nil, request_options: {})
            #
            # @param kb_id [String] Path param
            #
            # @param sender_id [String] Path param
            #
            # @param cursor [String] Query param
            #
            # @param limit [Integer] Query param
            #
            # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Zavudev::Internal::Cursor<Zavudev::Models::Senders::Agent::AgentDocument>]
            #
            # @see Zavudev::Models::Senders::Agent::KnowledgeBases::DocumentListParams
            def list(kb_id, params)
              parsed, options = Zavudev::Senders::Agent::KnowledgeBases::DocumentListParams.dump_request(params)
              query = Zavudev::Internal::Util.encode_query_params(parsed)
              sender_id =
                parsed.delete(:sender_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :get,
                path: ["v1/senders/%1$s/agent/knowledge-bases/%2$s/documents", sender_id, kb_id],
                query: query,
                page: Zavudev::Internal::Cursor,
                model: Zavudev::Senders::Agent::AgentDocument,
                options: options
              )
            end

            # Delete a document from a knowledge base.
            #
            # @overload delete(doc_id, sender_id:, kb_id:, request_options: {})
            #
            # @param doc_id [String]
            # @param sender_id [String]
            # @param kb_id [String]
            # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [nil]
            #
            # @see Zavudev::Models::Senders::Agent::KnowledgeBases::DocumentDeleteParams
            def delete(doc_id, params)
              parsed, options = Zavudev::Senders::Agent::KnowledgeBases::DocumentDeleteParams.dump_request(params)
              sender_id =
                parsed.delete(:sender_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              kb_id =
                parsed.delete(:kb_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :delete,
                path: ["v1/senders/%1$s/agent/knowledge-bases/%2$s/documents/%3$s", sender_id, kb_id, doc_id],
                model: NilClass,
                options: options
              )
            end

            # @api private
            #
            # @param client [Zavudev::Client]
            def initialize(client:)
              @client = client
            end
          end
        end
      end
    end
  end
end
