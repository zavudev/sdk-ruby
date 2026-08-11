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

        # @!attribute voice
        #   Voice Agent configuration. Enable this to let the agent answer and place phone
        #   calls with Zavu's managed voice pipeline. Requires the Voice Agents feature to
        #   be enabled for your team.
        #
        #   @return [Zavudev::Models::Senders::AgentCreateParams::Voice, nil]
        optional :voice, -> { Zavudev::Senders::AgentCreateParams::Voice }

        # @!method initialize(sender_id:, model:, name:, provider:, system_prompt:, api_key: nil, context_window_messages: nil, include_contact_metadata: nil, max_tokens: nil, temperature: nil, trigger_on_channels: nil, trigger_on_message_types: nil, voice: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::Senders::AgentCreateParams} for more details.
        #
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
        #   @param voice [Zavudev::Models::Senders::AgentCreateParams::Voice] Voice Agent configuration. Enable this to let the agent answer and place phone c
        #
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

        class Voice < Zavudev::Internal::Type::BaseModel
          # @!attribute enabled
          #   Whether the agent handles voice calls. When false, the sender's number is not
          #   answered by the voice agent and outbound calls are rejected.
          #
          #   @return [Boolean]
          required :enabled, Zavudev::Internal::Type::Boolean

          # @!attribute greeting
          #   Opening line the agent speaks when the call connects. If omitted, the agent
          #   waits for the caller to speak first.
          #
          #   @return [String, nil]
          optional :greeting, String

          # @!attribute greetings
          #   Greeting per language, keyed by language code. Used when the caller's language
          #   differs from the one `greeting` is written in.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :greetings, Zavudev::Internal::Type::HashOf[String]

          # @!attribute interruptible
          #   Whether the caller can interrupt the agent while it is speaking (barge-in). When
          #   true, the agent stops talking as soon as the caller starts.
          #
          #   @return [Boolean, nil]
          optional :interruptible, Zavudev::Internal::Type::Boolean

          # @!attribute language
          #   BCP-47 language code used for both speech recognition and speech synthesis (e.g.
          #   `en`, `es`, `pt-BR`). Auto-detected from the recipient when omitted.
          #
          #   @return [String, nil]
          optional :language, String

          # @!attribute max_call_duration_minutes
          #   Hard limit on call length in minutes. The call ends automatically when reached.
          #
          #   @return [Integer, nil]
          optional :max_call_duration_minutes, Integer, api_name: :maxCallDurationMinutes

          # @!attribute max_idle_seconds
          #   How long the agent waits during silence before ending the call.
          #
          #   @return [Integer, nil]
          optional :max_idle_seconds, Integer, api_name: :maxIdleSeconds

          # @!attribute model
          #   Model that runs the conversation, co-located in the voice network for lowest
          #   latency. Independent of the model used for text messaging. Derived from the
          #   agent's text model when omitted.
          #
          #   @return [String, nil]
          optional :model, String

          # @!attribute record_calls
          #   Whether the call audio is recorded.
          #
          #   @return [Boolean, nil]
          optional :record_calls, Zavudev::Internal::Type::Boolean, api_name: :recordCalls

          # @!attribute stt_model
          #   Speech-recognition model. Uses the default when omitted.
          #
          #   @return [String, nil]
          optional :stt_model, String, api_name: :sttModel

          # @!attribute stt_provider
          #   Speech-recognition provider. Uses the default when omitted.
          #
          #   @return [String, nil]
          optional :stt_provider, String, api_name: :sttProvider

          # @!attribute transfer_phone_number
          #   E.164 phone number the agent can transfer the call to. When set, the agent is
          #   given a transfer tool it can use to hand the call to a human.
          #
          #   @return [String, nil]
          optional :transfer_phone_number, String, api_name: :transferPhoneNumber

          # @!attribute tts_provider
          #   Speech-synthesis provider. Uses the default when omitted.
          #
          #   @return [String, nil]
          optional :tts_provider, String, api_name: :ttsProvider

          # @!attribute tts_voice_id
          #   Identifier of the synthesized voice that speaks. Choose from the voices
          #   available in the dashboard. Uses a neutral default when omitted.
          #
          #   @return [String, nil]
          optional :tts_voice_id, String, api_name: :ttsVoiceId

          # @!attribute voicemail_action
          #   What the agent does when an answering machine or voicemail is detected on an
          #   outbound call.
          #
          #   @return [Symbol, Zavudev::Models::Senders::AgentCreateParams::Voice::VoicemailAction, nil]
          optional :voicemail_action,
                   enum: -> { Zavudev::Senders::AgentCreateParams::Voice::VoicemailAction },
                   api_name: :voicemailAction

          # @!attribute voicemail_message
          #   Message spoken when `voicemailAction` is `leave_message`. Falls back to
          #   `greeting` when omitted.
          #
          #   @return [String, nil]
          optional :voicemail_message, String, api_name: :voicemailMessage

          # @!attribute voice_speed
          #   Speech rate. 1.0 is natural. Only honoured by voices that support rate control;
          #   ignored by the others.
          #
          #   @return [Float, nil]
          optional :voice_speed, Float, api_name: :voiceSpeed

          # @!method initialize(enabled:, greeting: nil, greetings: nil, interruptible: nil, language: nil, max_call_duration_minutes: nil, max_idle_seconds: nil, model: nil, record_calls: nil, stt_model: nil, stt_provider: nil, transfer_phone_number: nil, tts_provider: nil, tts_voice_id: nil, voicemail_action: nil, voicemail_message: nil, voice_speed: nil)
          #   Some parameter documentations has been truncated, see
          #   {Zavudev::Models::Senders::AgentCreateParams::Voice} for more details.
          #
          #   Voice Agent configuration. Enable this to let the agent answer and place phone
          #   calls with Zavu's managed voice pipeline. Requires the Voice Agents feature to
          #   be enabled for your team.
          #
          #   @param enabled [Boolean] Whether the agent handles voice calls. When false, the sender's number is not an
          #
          #   @param greeting [String] Opening line the agent speaks when the call connects. If omitted, the agent wait
          #
          #   @param greetings [Hash{Symbol=>String}] Greeting per language, keyed by language code. Used when the caller's language d
          #
          #   @param interruptible [Boolean] Whether the caller can interrupt the agent while it is speaking (barge-in). When
          #
          #   @param language [String] BCP-47 language code used for both speech recognition and speech synthesis (e.g.
          #
          #   @param max_call_duration_minutes [Integer] Hard limit on call length in minutes. The call ends automatically when reached.
          #
          #   @param max_idle_seconds [Integer] How long the agent waits during silence before ending the call.
          #
          #   @param model [String] Model that runs the conversation, co-located in the voice network for lowest lat
          #
          #   @param record_calls [Boolean] Whether the call audio is recorded.
          #
          #   @param stt_model [String] Speech-recognition model. Uses the default when omitted.
          #
          #   @param stt_provider [String] Speech-recognition provider. Uses the default when omitted.
          #
          #   @param transfer_phone_number [String] E.164 phone number the agent can transfer the call to. When set, the agent is gi
          #
          #   @param tts_provider [String] Speech-synthesis provider. Uses the default when omitted.
          #
          #   @param tts_voice_id [String] Identifier of the synthesized voice that speaks. Choose from the voices availabl
          #
          #   @param voicemail_action [Symbol, Zavudev::Models::Senders::AgentCreateParams::Voice::VoicemailAction] What the agent does when an answering machine or voicemail is detected on an out
          #
          #   @param voicemail_message [String] Message spoken when `voicemailAction` is `leave_message`. Falls back to `greetin
          #
          #   @param voice_speed [Float] Speech rate. 1.0 is natural. Only honoured by voices that support rate control;

          # What the agent does when an answering machine or voicemail is detected on an
          # outbound call.
          #
          # @see Zavudev::Models::Senders::AgentCreateParams::Voice#voicemail_action
          module VoicemailAction
            extend Zavudev::Internal::Type::Enum

            HANGUP = :hangup
            LEAVE_MESSAGE = :leave_message

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
