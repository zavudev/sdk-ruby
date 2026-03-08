# frozen_string_literal: true

module Zavudev
  module Models
    module Senders
      # @see Zavudev::Resources::Senders::Agent#update
      class AgentUpdateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute sender_id
        #
        #   @return [String]
        required :sender_id, String

        # @!attribute api_key
        #
        #   @return [String, nil]
        optional :api_key, String, api_name: :apiKey

        # @!attribute context_window_messages
        #
        #   @return [Integer, nil]
        optional :context_window_messages, Integer, api_name: :contextWindowMessages

        # @!attribute enabled
        #
        #   @return [Boolean, nil]
        optional :enabled, Zavudev::Internal::Type::Boolean

        # @!attribute include_contact_metadata
        #
        #   @return [Boolean, nil]
        optional :include_contact_metadata,
                 Zavudev::Internal::Type::Boolean,
                 api_name: :includeContactMetadata

        # @!attribute max_tokens
        #
        #   @return [Integer, nil]
        optional :max_tokens, Integer, api_name: :maxTokens, nil?: true

        # @!attribute model
        #
        #   @return [String, nil]
        optional :model, String

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute provider
        #   LLM provider for the AI agent.
        #
        #   @return [Symbol, Zavudev::Models::Senders::AgentProvider, nil]
        optional :provider, enum: -> { Zavudev::Senders::AgentProvider }

        # @!attribute system_prompt
        #
        #   @return [String, nil]
        optional :system_prompt, String, api_name: :systemPrompt

        # @!attribute temperature
        #
        #   @return [Float, nil]
        optional :temperature, Float, nil?: true

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

        # @!method initialize(sender_id:, api_key: nil, context_window_messages: nil, enabled: nil, include_contact_metadata: nil, max_tokens: nil, model: nil, name: nil, provider: nil, system_prompt: nil, temperature: nil, trigger_on_channels: nil, trigger_on_message_types: nil, request_options: {})
        #   @param sender_id [String]
        #
        #   @param api_key [String]
        #
        #   @param context_window_messages [Integer]
        #
        #   @param enabled [Boolean]
        #
        #   @param include_contact_metadata [Boolean]
        #
        #   @param max_tokens [Integer, nil]
        #
        #   @param model [String]
        #
        #   @param name [String]
        #
        #   @param provider [Symbol, Zavudev::Models::Senders::AgentProvider] LLM provider for the AI agent.
        #
        #   @param system_prompt [String]
        #
        #   @param temperature [Float, nil]
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
