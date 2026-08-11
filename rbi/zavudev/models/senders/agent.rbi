# typed: strong

module Zavudev
  module Models
    module Senders
      class SendersAgent < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Zavudev::Senders::SendersAgent, Zavudev::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        # Whether the agent is active.
        sig { returns(T::Boolean) }
        attr_accessor :enabled

        # Model ID (e.g., gpt-4o-mini, claude-3-5-sonnet).
        sig { returns(String) }
        attr_accessor :model

        sig { returns(String) }
        attr_accessor :name

        # LLM provider for the AI agent.
        sig { returns(Zavudev::Senders::AgentProvider::TaggedSymbol) }
        attr_accessor :provider

        sig { returns(String) }
        attr_accessor :sender_id

        # System prompt for the agent.
        sig { returns(String) }
        attr_accessor :system_prompt

        sig { returns(Time) }
        attr_accessor :updated_at

        # Number of previous messages to include as context.
        sig { returns(T.nilable(Integer)) }
        attr_reader :context_window_messages

        sig { params(context_window_messages: Integer).void }
        attr_writer :context_window_messages

        # Whether to include contact metadata in context.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_contact_metadata

        sig { params(include_contact_metadata: T::Boolean).void }
        attr_writer :include_contact_metadata

        # Maximum tokens for LLM response.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_tokens

        # Senders this agent answers on. An agent can serve several; `senderId` remains
        # the primary one, for compatibility.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :sender_ids

        sig { params(sender_ids: T::Array[String]).void }
        attr_writer :sender_ids

        sig { returns(T.nilable(Zavudev::Senders::SendersAgent::Stats)) }
        attr_reader :stats

        sig do
          params(stats: Zavudev::Senders::SendersAgent::Stats::OrHash).void
        end
        attr_writer :stats

        # LLM temperature (0-2).
        sig { returns(T.nilable(Float)) }
        attr_accessor :temperature

        # Channels that trigger the agent.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :trigger_on_channels

        sig { params(trigger_on_channels: T::Array[String]).void }
        attr_writer :trigger_on_channels

        # Message types that trigger the agent.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :trigger_on_message_types

        sig { params(trigger_on_message_types: T::Array[String]).void }
        attr_writer :trigger_on_message_types

        # Voice Agent configuration. When present and enabled, the agent can answer
        # inbound phone calls and place outbound calls with Zavu's managed voice pipeline.
        # Requires the Voice Agents feature to be enabled for your team.
        sig { returns(T.nilable(Zavudev::Senders::SendersAgent::Voice)) }
        attr_reader :voice

        sig do
          params(voice: Zavudev::Senders::SendersAgent::Voice::OrHash).void
        end
        attr_writer :voice

        # AI Agent configuration for a sender.
        sig do
          params(
            id: String,
            created_at: Time,
            enabled: T::Boolean,
            model: String,
            name: String,
            provider: Zavudev::Senders::AgentProvider::OrSymbol,
            sender_id: String,
            system_prompt: String,
            updated_at: Time,
            context_window_messages: Integer,
            include_contact_metadata: T::Boolean,
            max_tokens: T.nilable(Integer),
            sender_ids: T::Array[String],
            stats: Zavudev::Senders::SendersAgent::Stats::OrHash,
            temperature: T.nilable(Float),
            trigger_on_channels: T::Array[String],
            trigger_on_message_types: T::Array[String],
            voice: Zavudev::Senders::SendersAgent::Voice::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          # Whether the agent is active.
          enabled:,
          # Model ID (e.g., gpt-4o-mini, claude-3-5-sonnet).
          model:,
          name:,
          # LLM provider for the AI agent.
          provider:,
          sender_id:,
          # System prompt for the agent.
          system_prompt:,
          updated_at:,
          # Number of previous messages to include as context.
          context_window_messages: nil,
          # Whether to include contact metadata in context.
          include_contact_metadata: nil,
          # Maximum tokens for LLM response.
          max_tokens: nil,
          # Senders this agent answers on. An agent can serve several; `senderId` remains
          # the primary one, for compatibility.
          sender_ids: nil,
          stats: nil,
          # LLM temperature (0-2).
          temperature: nil,
          # Channels that trigger the agent.
          trigger_on_channels: nil,
          # Message types that trigger the agent.
          trigger_on_message_types: nil,
          # Voice Agent configuration. When present and enabled, the agent can answer
          # inbound phone calls and place outbound calls with Zavu's managed voice pipeline.
          # Requires the Voice Agents feature to be enabled for your team.
          voice: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              enabled: T::Boolean,
              model: String,
              name: String,
              provider: Zavudev::Senders::AgentProvider::TaggedSymbol,
              sender_id: String,
              system_prompt: String,
              updated_at: Time,
              context_window_messages: Integer,
              include_contact_metadata: T::Boolean,
              max_tokens: T.nilable(Integer),
              sender_ids: T::Array[String],
              stats: Zavudev::Senders::SendersAgent::Stats,
              temperature: T.nilable(Float),
              trigger_on_channels: T::Array[String],
              trigger_on_message_types: T::Array[String],
              voice: Zavudev::Senders::SendersAgent::Voice
            }
          )
        end
        def to_hash
        end

        class Stats < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::SendersAgent::Stats,
                Zavudev::Internal::AnyHash
              )
            end

          # Total cost in USD.
          sig { returns(T.nilable(Float)) }
          attr_reader :total_cost

          sig { params(total_cost: Float).void }
          attr_writer :total_cost

          sig { returns(T.nilable(Integer)) }
          attr_reader :total_invocations

          sig { params(total_invocations: Integer).void }
          attr_writer :total_invocations

          sig { returns(T.nilable(Integer)) }
          attr_reader :total_tokens_used

          sig { params(total_tokens_used: Integer).void }
          attr_writer :total_tokens_used

          sig do
            params(
              total_cost: Float,
              total_invocations: Integer,
              total_tokens_used: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Total cost in USD.
            total_cost: nil,
            total_invocations: nil,
            total_tokens_used: nil
          )
          end

          sig do
            override.returns(
              {
                total_cost: Float,
                total_invocations: Integer,
                total_tokens_used: Integer
              }
            )
          end
          def to_hash
          end
        end

        class Voice < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::SendersAgent::Voice,
                Zavudev::Internal::AnyHash
              )
            end

          # Whether the agent handles voice calls. When false, the sender's number is not
          # answered by the voice agent and outbound calls are rejected.
          sig { returns(T::Boolean) }
          attr_accessor :enabled

          # Opening line the agent speaks when the call connects. If omitted, the agent
          # waits for the caller to speak first.
          sig { returns(T.nilable(String)) }
          attr_reader :greeting

          sig { params(greeting: String).void }
          attr_writer :greeting

          # Greeting per language, keyed by language code. Used when the caller's language
          # differs from the one `greeting` is written in.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :greetings

          sig { params(greetings: T::Hash[Symbol, String]).void }
          attr_writer :greetings

          # Whether the caller can interrupt the agent while it is speaking (barge-in). When
          # true, the agent stops talking as soon as the caller starts.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :interruptible

          sig { params(interruptible: T::Boolean).void }
          attr_writer :interruptible

          # BCP-47 language code used for both speech recognition and speech synthesis (e.g.
          # `en`, `es`, `pt-BR`). Auto-detected from the recipient when omitted.
          sig { returns(T.nilable(String)) }
          attr_reader :language

          sig { params(language: String).void }
          attr_writer :language

          # Hard limit on call length in minutes. The call ends automatically when reached.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_call_duration_minutes

          sig { params(max_call_duration_minutes: Integer).void }
          attr_writer :max_call_duration_minutes

          # How long the agent waits during silence before ending the call.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_idle_seconds

          sig { params(max_idle_seconds: Integer).void }
          attr_writer :max_idle_seconds

          # Model that runs the conversation, co-located in the voice network for lowest
          # latency. Independent of the model used for text messaging. Derived from the
          # agent's text model when omitted.
          sig { returns(T.nilable(String)) }
          attr_reader :model

          sig { params(model: String).void }
          attr_writer :model

          # Whether the call audio is recorded.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :record_calls

          sig { params(record_calls: T::Boolean).void }
          attr_writer :record_calls

          # Speech-recognition model. Uses the default when omitted.
          sig { returns(T.nilable(String)) }
          attr_reader :stt_model

          sig { params(stt_model: String).void }
          attr_writer :stt_model

          # Speech-recognition provider. Uses the default when omitted.
          sig { returns(T.nilable(String)) }
          attr_reader :stt_provider

          sig { params(stt_provider: String).void }
          attr_writer :stt_provider

          # E.164 phone number the agent can transfer the call to. When set, the agent is
          # given a transfer tool it can use to hand the call to a human.
          sig { returns(T.nilable(String)) }
          attr_reader :transfer_phone_number

          sig { params(transfer_phone_number: String).void }
          attr_writer :transfer_phone_number

          # Speech-synthesis provider. Uses the default when omitted.
          sig { returns(T.nilable(String)) }
          attr_reader :tts_provider

          sig { params(tts_provider: String).void }
          attr_writer :tts_provider

          # Identifier of the synthesized voice that speaks. Choose from the voices
          # available in the dashboard. Uses a neutral default when omitted.
          sig { returns(T.nilable(String)) }
          attr_reader :tts_voice_id

          sig { params(tts_voice_id: String).void }
          attr_writer :tts_voice_id

          # What the agent does when an answering machine or voicemail is detected on an
          # outbound call.
          sig do
            returns(
              T.nilable(
                Zavudev::Senders::SendersAgent::Voice::VoicemailAction::TaggedSymbol
              )
            )
          end
          attr_reader :voicemail_action

          sig do
            params(
              voicemail_action:
                Zavudev::Senders::SendersAgent::Voice::VoicemailAction::OrSymbol
            ).void
          end
          attr_writer :voicemail_action

          # Message spoken when `voicemailAction` is `leave_message`. Falls back to
          # `greeting` when omitted.
          sig { returns(T.nilable(String)) }
          attr_reader :voicemail_message

          sig { params(voicemail_message: String).void }
          attr_writer :voicemail_message

          # Speech rate. 1.0 is natural. Only honoured by voices that support rate control;
          # ignored by the others.
          sig { returns(T.nilable(Float)) }
          attr_reader :voice_speed

          sig { params(voice_speed: Float).void }
          attr_writer :voice_speed

          # Voice Agent configuration. When present and enabled, the agent can answer
          # inbound phone calls and place outbound calls with Zavu's managed voice pipeline.
          # Requires the Voice Agents feature to be enabled for your team.
          sig do
            params(
              enabled: T::Boolean,
              greeting: String,
              greetings: T::Hash[Symbol, String],
              interruptible: T::Boolean,
              language: String,
              max_call_duration_minutes: Integer,
              max_idle_seconds: Integer,
              model: String,
              record_calls: T::Boolean,
              stt_model: String,
              stt_provider: String,
              transfer_phone_number: String,
              tts_provider: String,
              tts_voice_id: String,
              voicemail_action:
                Zavudev::Senders::SendersAgent::Voice::VoicemailAction::OrSymbol,
              voicemail_message: String,
              voice_speed: Float
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether the agent handles voice calls. When false, the sender's number is not
            # answered by the voice agent and outbound calls are rejected.
            enabled:,
            # Opening line the agent speaks when the call connects. If omitted, the agent
            # waits for the caller to speak first.
            greeting: nil,
            # Greeting per language, keyed by language code. Used when the caller's language
            # differs from the one `greeting` is written in.
            greetings: nil,
            # Whether the caller can interrupt the agent while it is speaking (barge-in). When
            # true, the agent stops talking as soon as the caller starts.
            interruptible: nil,
            # BCP-47 language code used for both speech recognition and speech synthesis (e.g.
            # `en`, `es`, `pt-BR`). Auto-detected from the recipient when omitted.
            language: nil,
            # Hard limit on call length in minutes. The call ends automatically when reached.
            max_call_duration_minutes: nil,
            # How long the agent waits during silence before ending the call.
            max_idle_seconds: nil,
            # Model that runs the conversation, co-located in the voice network for lowest
            # latency. Independent of the model used for text messaging. Derived from the
            # agent's text model when omitted.
            model: nil,
            # Whether the call audio is recorded.
            record_calls: nil,
            # Speech-recognition model. Uses the default when omitted.
            stt_model: nil,
            # Speech-recognition provider. Uses the default when omitted.
            stt_provider: nil,
            # E.164 phone number the agent can transfer the call to. When set, the agent is
            # given a transfer tool it can use to hand the call to a human.
            transfer_phone_number: nil,
            # Speech-synthesis provider. Uses the default when omitted.
            tts_provider: nil,
            # Identifier of the synthesized voice that speaks. Choose from the voices
            # available in the dashboard. Uses a neutral default when omitted.
            tts_voice_id: nil,
            # What the agent does when an answering machine or voicemail is detected on an
            # outbound call.
            voicemail_action: nil,
            # Message spoken when `voicemailAction` is `leave_message`. Falls back to
            # `greeting` when omitted.
            voicemail_message: nil,
            # Speech rate. 1.0 is natural. Only honoured by voices that support rate control;
            # ignored by the others.
            voice_speed: nil
          )
          end

          sig do
            override.returns(
              {
                enabled: T::Boolean,
                greeting: String,
                greetings: T::Hash[Symbol, String],
                interruptible: T::Boolean,
                language: String,
                max_call_duration_minutes: Integer,
                max_idle_seconds: Integer,
                model: String,
                record_calls: T::Boolean,
                stt_model: String,
                stt_provider: String,
                transfer_phone_number: String,
                tts_provider: String,
                tts_voice_id: String,
                voicemail_action:
                  Zavudev::Senders::SendersAgent::Voice::VoicemailAction::TaggedSymbol,
                voicemail_message: String,
                voice_speed: Float
              }
            )
          end
          def to_hash
          end

          # What the agent does when an answering machine or voicemail is detected on an
          # outbound call.
          module VoicemailAction
            extend Zavudev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Zavudev::Senders::SendersAgent::Voice::VoicemailAction
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            HANGUP =
              T.let(
                :hangup,
                Zavudev::Senders::SendersAgent::Voice::VoicemailAction::TaggedSymbol
              )
            LEAVE_MESSAGE =
              T.let(
                :leave_message,
                Zavudev::Senders::SendersAgent::Voice::VoicemailAction::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Zavudev::Senders::SendersAgent::Voice::VoicemailAction::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
