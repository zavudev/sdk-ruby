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

        # @!attribute sender_ids
        #   Senders this agent answers on. An agent can serve several; `senderId` remains
        #   the primary one, for compatibility.
        #
        #   @return [Array<String>, nil]
        optional :sender_ids, Zavudev::Internal::Type::ArrayOf[String], api_name: :senderIds

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

        # @!attribute voice
        #   Voice Agent configuration. When present and enabled, the agent can answer
        #   inbound phone calls and place outbound calls with Zavu's managed voice pipeline.
        #   Requires the Voice Agents feature to be enabled for your team.
        #
        #   @return [Zavudev::Models::Senders::SendersAgent::Voice, nil]
        optional :voice, -> { Zavudev::Senders::SendersAgent::Voice }

        # @!method initialize(id:, created_at:, enabled:, model:, name:, provider:, sender_id:, system_prompt:, updated_at:, context_window_messages: nil, include_contact_metadata: nil, max_tokens: nil, sender_ids: nil, stats: nil, temperature: nil, trigger_on_channels: nil, trigger_on_message_types: nil, voice: nil)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::Senders::SendersAgent} for more details.
        #
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
        #   @param sender_ids [Array<String>] Senders this agent answers on. An agent can serve several; `senderId` remains th
        #
        #   @param stats [Zavudev::Models::Senders::SendersAgent::Stats]
        #
        #   @param temperature [Float, nil] LLM temperature (0-2).
        #
        #   @param trigger_on_channels [Array<String>] Channels that trigger the agent.
        #
        #   @param trigger_on_message_types [Array<String>] Message types that trigger the agent.
        #
        #   @param voice [Zavudev::Models::Senders::SendersAgent::Voice] Voice Agent configuration. When present and enabled, the agent can answer inboun

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

        # @see Zavudev::Models::Senders::SendersAgent#voice
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
          #   @return [Symbol, Zavudev::Models::Senders::SendersAgent::Voice::VoicemailAction, nil]
          optional :voicemail_action,
                   enum: -> { Zavudev::Senders::SendersAgent::Voice::VoicemailAction },
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
          #   {Zavudev::Models::Senders::SendersAgent::Voice} for more details.
          #
          #   Voice Agent configuration. When present and enabled, the agent can answer
          #   inbound phone calls and place outbound calls with Zavu's managed voice pipeline.
          #   Requires the Voice Agents feature to be enabled for your team.
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
          #   @param voicemail_action [Symbol, Zavudev::Models::Senders::SendersAgent::Voice::VoicemailAction] What the agent does when an answering machine or voicemail is detected on an out
          #
          #   @param voicemail_message [String] Message spoken when `voicemailAction` is `leave_message`. Falls back to `greetin
          #
          #   @param voice_speed [Float] Speech rate. 1.0 is natural. Only honoured by voices that support rate control;

          # What the agent does when an answering machine or voicemail is detected on an
          # outbound call.
          #
          # @see Zavudev::Models::Senders::SendersAgent::Voice#voicemail_action
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
