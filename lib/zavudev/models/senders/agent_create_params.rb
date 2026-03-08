# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      # @see Zavudev::Resources::Senders::Agent#create
      class AgentCreateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute sender_id
        #
        #   @return [String]
        required :sender_id, String

        # @!attribute model
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

        # @!attribute system_prompt
        #
        #   @return [String]
        required :system_prompt, String, api_name: :systemPrompt

        # @!attribute api_key
        #   API key for the LLM provider. Required unless provider is 'zavu'.
        #
        #   @return [String, nil]
        optional :api_key, String, api_name: :apiKey

        # @!attribute context_window_messages
        #
        #   @return [Integer, nil]
        optional :context_window_messages, Integer, api_name: :contextWindowMessages

        # @!attribute include_contact_metadata
        #
        #   @return [Boolean, nil]
        optional :include_contact_metadata,
                 Zavudev::Internal::Type::Boolean,
                 api_name: :includeContactMetadata

        # @!attribute max_tokens
        #
        #   @return [Integer, nil]
        optional :max_tokens, Integer, api_name: :maxTokens

        # @!attribute temperature
        #
        #   @return [Float, nil]
        optional :temperature, Float

        # @!attribute trigger_on_channels
        #
        #   @return [Array<String>, nil]
        optional :trigger_on_channels, Zavudev::Internal::Type::ArrayOf[String], api_name: :triggerOnChannels

        # @!attribute trigger_on_message_types
        #
        #   @return [Array<String>, nil]
        optional :trigger_on_message_types,
                 Zavudev::Internal::Type::ArrayOf[String],
                 api_name: :triggerOnMessageTypes

        # @!method initialize(sender_id:, model:, name:, provider:, system_prompt:, api_key: nil, context_window_messages: nil, include_contact_metadata: nil, max_tokens: nil, temperature: nil, trigger_on_channels: nil, trigger_on_message_types: nil, request_options: {})
        #   @param sender_id [String]
        #
        #   @param model [String]
        #
        #   @param name [String]
        #
        #   @param provider [Symbol, Zavudev::Models::Senders::AgentProvider] LLM provider for the AI agent.
        #
        #   @param system_prompt [String]
        #
        #   @param api_key [String] API key for the LLM provider. Required unless provider is 'zavu'.
        #
        #   @param context_window_messages [Integer]
        #
        #   @param include_contact_metadata [Boolean]
        #
        #   @param max_tokens [Integer]
        #
        #   @param temperature [Float]
        #
        #   @param trigger_on_channels [Array<String>]
        #
        #   @param trigger_on_message_types [Array<String>]
        #
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
