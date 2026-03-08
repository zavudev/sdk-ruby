# frozen_string_literal: true

module Zavudev
  module Resources
    class Senders
      class Agent
        # @return [Zavudev::Resources::Senders::Agent::Executions]
        attr_reader :executions

        # @return [Zavudev::Resources::Senders::Agent::Flows]
        attr_reader :flows

        # @return [Zavudev::Resources::Senders::Agent::Tools]
        attr_reader :tools

        # @return [Zavudev::Resources::Senders::Agent::KnowledgeBases]
        attr_reader :knowledge_bases

        # Create an AI agent for a sender. Each sender can have at most one agent.
        #
        # @overload create(sender_id, model:, name:, provider:, system_prompt:, api_key: nil, context_window_messages: nil, include_contact_metadata: nil, max_tokens: nil, temperature: nil, trigger_on_channels: nil, trigger_on_message_types: nil, request_options: {})
        #
        # @param sender_id [String]
        #
        # @param model [String]
        #
        # @param name [String]
        #
        # @param provider [Symbol, Zavudev::Models::Senders::AgentProvider] LLM provider for the AI agent.
        #
        # @param system_prompt [String]
        #
        # @param api_key [String] API key for the LLM provider. Required unless provider is 'zavu'.
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
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Senders::AgentResponse]
        #
        # @see Zavudev::Models::Senders::AgentCreateParams
        def create(sender_id, params)
          parsed, options = Zavudev::Senders::AgentCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/senders/%1$s/agent", sender_id],
            body: parsed,
            model: Zavudev::Senders::AgentResponse,
            options: options
          )
        end

        # Get the AI agent configuration for a sender.
        #
        # @overload retrieve(sender_id, request_options: {})
        #
        # @param sender_id [String]
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Senders::AgentResponse]
        #
        # @see Zavudev::Models::Senders::AgentRetrieveParams
        def retrieve(sender_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/senders/%1$s/agent", sender_id],
            model: Zavudev::Senders::AgentResponse,
            options: params[:request_options]
          )
        end

        # Update an AI agent's configuration.
        #
        # @overload update(sender_id, api_key: nil, context_window_messages: nil, enabled: nil, include_contact_metadata: nil, max_tokens: nil, model: nil, name: nil, provider: nil, system_prompt: nil, temperature: nil, trigger_on_channels: nil, trigger_on_message_types: nil, request_options: {})
        #
        # @param sender_id [String]
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
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Senders::AgentResponse]
        #
        # @see Zavudev::Models::Senders::AgentUpdateParams
        def update(sender_id, params = {})
          parsed, options = Zavudev::Senders::AgentUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: ["v1/senders/%1$s/agent", sender_id],
            body: parsed,
            model: Zavudev::Senders::AgentResponse,
            options: options
          )
        end

        # Delete an AI agent.
        #
        # @overload delete(sender_id, request_options: {})
        #
        # @param sender_id [String]
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Zavudev::Models::Senders::AgentDeleteParams
        def delete(sender_id, params = {})
          @client.request(
            method: :delete,
            path: ["v1/senders/%1$s/agent", sender_id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # Get statistics for an AI agent including invocations, tokens, and costs.
        #
        # @overload stats(sender_id, request_options: {})
        #
        # @param sender_id [String]
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Senders::AgentStats]
        #
        # @see Zavudev::Models::Senders::AgentStatsParams
        def stats(sender_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/senders/%1$s/agent/stats", sender_id],
            model: Zavudev::Senders::AgentStats,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Zavudev::Client]
        def initialize(client:)
          @client = client
          @executions = Zavudev::Resources::Senders::Agent::Executions.new(client: client)
          @flows = Zavudev::Resources::Senders::Agent::Flows.new(client: client)
          @tools = Zavudev::Resources::Senders::Agent::Tools.new(client: client)
          @knowledge_bases = Zavudev::Resources::Senders::Agent::KnowledgeBases.new(client: client)
        end
      end
    end
  end
end
