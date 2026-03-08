# frozen_string_literal: true

module Zavudev
  module Resources
    class Senders
      class Agent
        class KnowledgeBases
          # @return [Zavudev::Resources::Senders::Agent::KnowledgeBases::Documents]
          attr_reader :documents

          # Create a new knowledge base for an agent.
          #
          # @overload create(sender_id, name:, description: nil, request_options: {})
          #
          # @param sender_id [String]
          # @param name [String]
          # @param description [String]
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Senders::Agent::KnowledgeBaseCreateResponse]
          #
          # @see Zavudev::Models::Senders::Agent::KnowledgeBaseCreateParams
          def create(sender_id, params)
            parsed, options = Zavudev::Senders::Agent::KnowledgeBaseCreateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/senders/%1$s/agent/knowledge-bases", sender_id],
              body: parsed,
              model: Zavudev::Models::Senders::Agent::KnowledgeBaseCreateResponse,
              options: options
            )
          end

          # Get a specific knowledge base.
          #
          # @overload retrieve(kb_id, sender_id:, request_options: {})
          #
          # @param kb_id [String]
          # @param sender_id [String]
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Senders::Agent::KnowledgeBaseRetrieveResponse]
          #
          # @see Zavudev::Models::Senders::Agent::KnowledgeBaseRetrieveParams
          def retrieve(kb_id, params)
            parsed, options = Zavudev::Senders::Agent::KnowledgeBaseRetrieveParams.dump_request(params)
            sender_id =
              parsed.delete(:sender_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["v1/senders/%1$s/agent/knowledge-bases/%2$s", sender_id, kb_id],
              model: Zavudev::Models::Senders::Agent::KnowledgeBaseRetrieveResponse,
              options: options
            )
          end

          # Update a knowledge base.
          #
          # @overload update(kb_id, sender_id:, description: nil, name: nil, request_options: {})
          #
          # @param kb_id [String] Path param
          #
          # @param sender_id [String] Path param
          #
          # @param description [String, nil] Body param
          #
          # @param name [String] Body param
          #
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Models::Senders::Agent::KnowledgeBaseUpdateResponse]
          #
          # @see Zavudev::Models::Senders::Agent::KnowledgeBaseUpdateParams
          def update(kb_id, params)
            parsed, options = Zavudev::Senders::Agent::KnowledgeBaseUpdateParams.dump_request(params)
            sender_id =
              parsed.delete(:sender_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :patch,
              path: ["v1/senders/%1$s/agent/knowledge-bases/%2$s", sender_id, kb_id],
              body: parsed,
              model: Zavudev::Models::Senders::Agent::KnowledgeBaseUpdateResponse,
              options: options
            )
          end

          # List knowledge bases for an agent.
          #
          # @overload list(sender_id, cursor: nil, limit: nil, request_options: {})
          #
          # @param sender_id [String]
          # @param cursor [String]
          # @param limit [Integer]
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Zavudev::Internal::Cursor<Zavudev::Models::Senders::Agent::AgentKnowledgeBase>]
          #
          # @see Zavudev::Models::Senders::Agent::KnowledgeBaseListParams
          def list(sender_id, params = {})
            parsed, options = Zavudev::Senders::Agent::KnowledgeBaseListParams.dump_request(params)
            query = Zavudev::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: ["v1/senders/%1$s/agent/knowledge-bases", sender_id],
              query: query,
              page: Zavudev::Internal::Cursor,
              model: Zavudev::Senders::Agent::AgentKnowledgeBase,
              options: options
            )
          end

          # Delete a knowledge base and all its documents.
          #
          # @overload delete(kb_id, sender_id:, request_options: {})
          #
          # @param kb_id [String]
          # @param sender_id [String]
          # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [nil]
          #
          # @see Zavudev::Models::Senders::Agent::KnowledgeBaseDeleteParams
          def delete(kb_id, params)
            parsed, options = Zavudev::Senders::Agent::KnowledgeBaseDeleteParams.dump_request(params)
            sender_id =
              parsed.delete(:sender_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :delete,
              path: ["v1/senders/%1$s/agent/knowledge-bases/%2$s", sender_id, kb_id],
              model: NilClass,
              options: options
            )
          end

          # @api private
          #
          # @param client [Zavudev::Client]
          def initialize(client:)
            @client = client
            @documents = Zavudev::Resources::Senders::Agent::KnowledgeBases::Documents.new(client: client)
          end
        end
      end
    end
  end
end
