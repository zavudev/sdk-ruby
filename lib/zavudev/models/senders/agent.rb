# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      class SendersAgent < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute enabled
        #   Whether the agent is active.
        #
        #   @return [Boolean]
        required :enabled, Zavudev::Internal::Type::Boolean

        # @!attribute model
        #   Model ID (e.g., gpt-4o-mini, claude-3-5-sonnet).
        #
        #   @return [String]
        required :model, String

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute provider
        #   LLM provider for the AI agent.
        #
        #   @return [Symbol, Zavudev::Models::Senders::AgentProvider]
        required :provider, enum: -> { Zavudev::Senders::AgentProvider }

        # @!attribute sender_id
        #
        #   @return [String]
        required :sender_id, String, api_name: :senderId

        # @!attribute system_prompt
        #   System prompt for the agent.
        #
        #   @return [String]
        required :system_prompt, String, api_name: :systemPrompt

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!attribute context_window_messages
        #   Number of previous messages to include as context.
        #
        #   @return [Integer, nil]
        optional :context_window_messages, Integer, api_name: :contextWindowMessages

        # @!attribute include_contact_metadata
        #   Whether to include contact metadata in context.
        #
        #   @return [Boolean, nil]
        optional :include_contact_metadata,
                 Zavudev::Internal::Type::Boolean,
                 api_name: :includeContactMetadata

        # @!attribute max_tokens
        #   Maximum tokens for LLM response.
        #
        #   @return [Integer, nil]
        optional :max_tokens, Integer, api_name: :maxTokens, nil?: true

        # @!attribute stats
        #
        #   @return [Zavudev::Models::Senders::SendersAgent::Stats, nil]
        optional :stats, -> { Zavudev::Senders::SendersAgent::Stats }

        # @!attribute temperature
        #   LLM temperature (0-2).
        #
        #   @return [Float, nil]
        optional :temperature, Float, nil?: true

        # @!attribute trigger_on_channels
        #   Channels that trigger the agent.
        #
        #   @return [Array<String>, nil]
        optional :trigger_on_channels, Zavudev::Internal::Type::ArrayOf[String], api_name: :triggerOnChannels

        # @!attribute trigger_on_message_types
        #   Message types that trigger the agent.
        #
        #   @return [Array<String>, nil]
        optional :trigger_on_message_types,
                 Zavudev::Internal::Type::ArrayOf[String],
                 api_name: :triggerOnMessageTypes

        # @!method initialize(id:, created_at:, enabled:, model:, name:, provider:, sender_id:, system_prompt:, updated_at:, context_window_messages: nil, include_contact_metadata: nil, max_tokens: nil, stats: nil, temperature: nil, trigger_on_channels: nil, trigger_on_message_types: nil)
        #   AI Agent configuration for a sender.
        #
        #   @param id [String]
        #
        #   @param created_at [Time]
        #
        #   @param enabled [Boolean] Whether the agent is active.
        #
        #   @param model [String] Model ID (e.g., gpt-4o-mini, claude-3-5-sonnet).
        #
        #   @param name [String]
        #
        #   @param provider [Symbol, Zavudev::Models::Senders::AgentProvider] LLM provider for the AI agent.
        #
        #   @param sender_id [String]
        #
        #   @param system_prompt [String] System prompt for the agent.
        #
        #   @param updated_at [Time]
        #
        #   @param context_window_messages [Integer] Number of previous messages to include as context.
        #
        #   @param include_contact_metadata [Boolean] Whether to include contact metadata in context.
        #
        #   @param max_tokens [Integer, nil] Maximum tokens for LLM response.
        #
        #   @param stats [Zavudev::Models::Senders::SendersAgent::Stats]
        #
        #   @param temperature [Float, nil] LLM temperature (0-2).
        #
        #   @param trigger_on_channels [Array<String>] Channels that trigger the agent.
        #
        #   @param trigger_on_message_types [Array<String>] Message types that trigger the agent.

        # @see Zavudev::Models::Senders::SendersAgent#stats
        class Stats < Zavudev::Internal::Type::BaseModel
          # @!attribute total_cost
          #   Total cost in USD.
          #
          #   @return [Float, nil]
          optional :total_cost, Float, api_name: :totalCost

          # @!attribute total_invocations
          #
          #   @return [Integer, nil]
          optional :total_invocations, Integer, api_name: :totalInvocations

          # @!attribute total_tokens_used
          #
          #   @return [Integer, nil]
          optional :total_tokens_used, Integer, api_name: :totalTokensUsed

          # @!method initialize(total_cost: nil, total_invocations: nil, total_tokens_used: nil)
          #   @param total_cost [Float] Total cost in USD.
          #
          #   @param total_invocations [Integer]
          #
          #   @param total_tokens_used [Integer]
        end
      end
    end
  end
end
