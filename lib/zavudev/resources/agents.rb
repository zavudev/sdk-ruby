# frozen_string_literal: true

module Zavudev
  module Resources
    class Agents
      # @return [Zavudev::Resources::Agents::Senders]
      attr_reader :senders

      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::AgentCreateParams} for more details.
      #
      # Create an agent without a sender. It is created disabled; connect a sender and
      # enable it when you are ready for it to answer.
      #
      # **Sub-resources.** An agent's tools, flows and knowledge bases are reachable at
      # `/v1/agents/{agentId}/tools`, `/v1/agents/{agentId}/flows` and
      # `/v1/agents/{agentId}/knowledge-bases`, mirroring the sender-scoped routes
      # documented under `/v1/senders/{senderId}/agent/...` exactly. Use the
      # agent-scoped form while the agent has no sender: the sender-scoped one cannot
      # address it.
      #
      # @overload create(model:, name:, provider:, system_prompt:, context_window_messages: nil, include_contact_metadata: nil, max_tokens: nil, temperature: nil, trigger_on_channels: nil, trigger_on_message_types: nil, voice: nil, request_options: {})
      #
      # @param model [String]
      #
      # @param name [String]
      #
      # @param provider [Symbol, Zavudev::Models::Senders::AgentProvider] LLM provider for the AI agent.
      #
      # @param system_prompt [String]
      #
      # @param context_window_messages [Integer]
      #
      # @param include_contact_metadata [Boolean]
      #
      # @param max_tokens [Integer]
      #
      # @param temperature [Float]
      #
      # @param trigger_on_channels [Array<String>]
      #
      # @param trigger_on_message_types [Array<String>]
      #
      # @param voice [Zavudev::Models::AgentCreateParams::Voice] Voice Agent configuration on a sender's AI agent. Controls how the agent behaves
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::AgentCreateResponse]
      #
      # @see Zavudev::Models::AgentCreateParams
      def create(params)
        parsed, options = Zavudev::AgentCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/agents",
          body: parsed,
          model: Zavudev::Models::AgentCreateResponse,
          options: options
        )
      end

      # Get an agent
      #
      # @overload retrieve(agent_id, request_options: {})
      #
      # @param agent_id [String] Agent ID.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::AgentRetrieveResponse]
      #
      # @see Zavudev::Models::AgentRetrieveParams
      def retrieve(agent_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/agents/%1$s", agent_id],
          model: Zavudev::Models::AgentRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::AgentUpdateParams} for more details.
      #
      # Update an agent
      #
      # @overload update(agent_id, api_key: nil, context_window_messages: nil, enabled: nil, include_contact_metadata: nil, max_tokens: nil, model: nil, name: nil, provider: nil, system_prompt: nil, temperature: nil, trigger_on_channels: nil, trigger_on_message_types: nil, voice: nil, request_options: {})
      #
      # @param agent_id [String] Agent ID.
      #
      # @param api_key [String]
      #
      # @param context_window_messages [Integer]
      #
      # @param enabled [Boolean]
      #
      # @param include_contact_metadata [Boolean]
      #
      # @param max_tokens [Integer, nil]
      #
      # @param model [String]
      #
      # @param name [String]
      #
      # @param provider [Symbol, Zavudev::Models::Senders::AgentProvider] LLM provider for the AI agent.
      #
      # @param system_prompt [String]
      #
      # @param temperature [Float, nil]
      #
      # @param trigger_on_channels [Array<String>]
      #
      # @param trigger_on_message_types [Array<String>]
      #
      # @param voice [Zavudev::Models::AgentUpdateParams::Voice] Voice Agent configuration. Patch this object to enable voice, change the greetin
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::AgentUpdateResponse]
      #
      # @see Zavudev::Models::AgentUpdateParams
      def update(agent_id, params = {})
        parsed, options = Zavudev::AgentUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/agents/%1$s", agent_id],
          body: parsed,
          model: Zavudev::Models::AgentUpdateResponse,
          options: options
        )
      end

      # Every agent in the project, newest first — including agents that are not
      # connected to any sender yet, which the sender-scoped routes cannot reach. Each
      # item carries `senderIds`, the senders the agent answers on.
      #
      # @overload list(cursor: nil, limit: nil, request_options: {})
      #
      # @param cursor [String]
      # @param limit [Integer]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::Senders::SendersAgent>]
      #
      # @see Zavudev::Models::AgentListParams
      def list(params = {})
        parsed, options = Zavudev::AgentListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/agents",
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::Senders::SendersAgent,
          options: options
        )
      end

      # Delete an agent
      #
      # @overload delete(agent_id, request_options: {})
      #
      # @param agent_id [String] Agent ID.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Zavudev::Models::AgentDeleteParams
      def delete(agent_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/agents/%1$s", agent_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # The voices an agent can speak with, for `voice.ttsVoiceId`. Filter by `language`
      # to get the ones that speak it; a voice can still be used with `language: auto`,
      # where the agent follows the caller and keeps the chosen voice.
      #
      # @overload list_voices(language: nil, request_options: {})
      #
      # @param language [String] BCP-47 tag (`en`, `es`, `pt-BR`). Omit, or pass `auto`, for every voice.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::AgentListVoicesResponse]
      #
      # @see Zavudev::Models::AgentListVoicesParams
      def list_voices(params = {})
        parsed, options = Zavudev::AgentListVoicesParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/agents/voices",
          query: query,
          model: Zavudev::Models::AgentListVoicesResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::AgentTestParams} for more details.
      #
      # Run the agent's prompt, model and knowledge base against a message and return
      # the reply instead of delivering it. Writes nothing and charges nothing, so it is
      # safe to call repeatedly while iterating on a prompt.
      #
      # Note that a dry run never **executes** tools — running them would cause real
      # side effects. Live conversations on every channel do call them. When the agent
      # has enabled tools, that gap is reported in `warnings` rather than silently
      # producing an answer that looks like a tool call happened.
      #
      # @overload test_(agent_id, message:, execute_tools: nil, history: nil, use_knowledge_base: nil, request_options: {})
      #
      # @param agent_id [String] Agent ID.
      #
      # @param message [String] What to say to the agent.
      #
      # @param execute_tools [Boolean] Run the tools the agent calls instead of reporting the choice and stopping.
      #
      # @param history [Array<Zavudev::Models::AgentTestParams::History>] Prior turns, oldest first, to exercise multi-turn behaviour without persisting a
      #
      # @param use_knowledge_base [Boolean] Set false to skip retrieval and isolate prompt behaviour from the knowledge base
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::AgentTestResponse]
      #
      # @see Zavudev::Models::AgentTestParams
      def test_(agent_id, params)
        parsed, options = Zavudev::AgentTestParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/agents/%1$s/test", agent_id],
          body: parsed,
          model: Zavudev::Models::AgentTestResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Zavudev::Client]
      def initialize(client:)
        @client = client
        @senders = Zavudev::Resources::Agents::Senders.new(client: client)
      end
    end
  end
end
