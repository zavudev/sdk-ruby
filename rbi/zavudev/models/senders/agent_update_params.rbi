# typed: strong

module Zavudev
  module Models
    module Senders
      class AgentUpdateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Senders::AgentUpdateParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :sender_id

        sig { returns(T.nilable(String)) }
        attr_reader :api_key

        sig { params(api_key: String).void }
        attr_writer :api_key

        sig { returns(T.nilable(Integer)) }
        attr_reader :context_window_messages

        sig { params(context_window_messages: Integer).void }
        attr_writer :context_window_messages

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enabled

        sig { params(enabled: T::Boolean).void }
        attr_writer :enabled

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_contact_metadata

        sig { params(include_contact_metadata: T::Boolean).void }
        attr_writer :include_contact_metadata

        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_tokens

        sig { returns(T.nilable(String)) }
        attr_reader :model

        sig { params(model: String).void }
        attr_writer :model

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # LLM provider for the AI agent.
        sig { returns(T.nilable(Zavudev::Senders::AgentProvider::OrSymbol)) }
        attr_reader :provider

        sig { params(provider: Zavudev::Senders::AgentProvider::OrSymbol).void }
        attr_writer :provider

        sig { returns(T.nilable(String)) }
        attr_reader :system_prompt

        sig { params(system_prompt: String).void }
        attr_writer :system_prompt

        sig { returns(T.nilable(Float)) }
        attr_accessor :temperature

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :trigger_on_channels

        sig { params(trigger_on_channels: T::Array[String]).void }
        attr_writer :trigger_on_channels

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :trigger_on_message_types

        sig { params(trigger_on_message_types: T::Array[String]).void }
        attr_writer :trigger_on_message_types

        # Voice Agent configuration. Patch this object to enable voice, change the
        # greeting, or adjust call limits. Requires the Voice Agents feature to be enabled
        # for your team.
        sig { returns(T.nilable(Zavudev::Senders::AgentUpdateParams::Voice)) }
        attr_reader :voice

        sig do
          params(voice: Zavudev::Senders::AgentUpdateParams::Voice::OrHash).void
        end
        attr_writer :voice

        sig do
          params(
            sender_id: String,
            api_key: String,
            context_window_messages: Integer,
            enabled: T::Boolean,
            include_contact_metadata: T::Boolean,
            max_tokens: T.nilable(Integer),
            model: String,
            name: String,
            provider: Zavudev::Senders::AgentProvider::OrSymbol,
            system_prompt: String,
            temperature: T.nilable(Float),
            trigger_on_channels: T::Array[String],
            trigger_on_message_types: T::Array[String],
            voice: Zavudev::Senders::AgentUpdateParams::Voice::OrHash,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          sender_id:,
          api_key: nil,
          context_window_messages: nil,
          enabled: nil,
          include_contact_metadata: nil,
          max_tokens: nil,
          model: nil,
          name: nil,
          # LLM provider for the AI agent.
          provider: nil,
          system_prompt: nil,
          temperature: nil,
          trigger_on_channels: nil,
          trigger_on_message_types: nil,
          # Voice Agent configuration. Patch this object to enable voice, change the
          # greeting, or adjust call limits. Requires the Voice Agents feature to be enabled
          # for your team.
          voice: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              sender_id: String,
              api_key: String,
              context_window_messages: Integer,
              enabled: T::Boolean,
              include_contact_metadata: T::Boolean,
              max_tokens: T.nilable(Integer),
              model: String,
              name: String,
              provider: Zavudev::Senders::AgentProvider::OrSymbol,
              system_prompt: String,
              temperature: T.nilable(Float),
              trigger_on_channels: T::Array[String],
              trigger_on_message_types: T::Array[String],
              voice: Zavudev::Senders::AgentUpdateParams::Voice,
              request_options: Zavudev::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Voice < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::AgentUpdateParams::Voice,
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
                Zavudev::Senders::AgentUpdateParams::Voice::VoicemailAction::OrSymbol
              )
            )
          end
          attr_reader :voicemail_action

          sig do
            params(
              voicemail_action:
                Zavudev::Senders::AgentUpdateParams::Voice::VoicemailAction::OrSymbol
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

          # Voice Agent configuration. Patch this object to enable voice, change the
          # greeting, or adjust call limits. Requires the Voice Agents feature to be enabled
          # for your team.
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
                Zavudev::Senders::AgentUpdateParams::Voice::VoicemailAction::OrSymbol,
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
                  Zavudev::Senders::AgentUpdateParams::Voice::VoicemailAction::OrSymbol,
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
                  Zavudev::Senders::AgentUpdateParams::Voice::VoicemailAction
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            HANGUP =
              T.let(
                :hangup,
                Zavudev::Senders::AgentUpdateParams::Voice::VoicemailAction::TaggedSymbol
              )
            LEAVE_MESSAGE =
              T.let(
                :leave_message,
                Zavudev::Senders::AgentUpdateParams::Voice::VoicemailAction::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Zavudev::Senders::AgentUpdateParams::Voice::VoicemailAction::TaggedSymbol
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
