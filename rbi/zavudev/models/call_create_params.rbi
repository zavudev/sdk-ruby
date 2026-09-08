# typed: strong

module Zavudev
  module Models
    class CallCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::CallCreateParams, Zavudev::Internal::AnyHash)
        end

      # Recipient phone number in E.164 format.
      sig { returns(String) }
      attr_accessor :to

      # Overrides the agent's configured greeting for this call only.
      sig { returns(T.nilable(String)) }
      attr_reader :greeting

      sig { params(greeting: String).void }
      attr_writer :greeting

      # Language the agent speaks on this call only, as a BCP-47 tag (`en`, `es`,
      # `es-ES`, `pt-BR`), or `auto` to detect the caller's language and follow it.
      # Overrides the agent's configured language for speech recognition, the agent's
      # replies, and the synthesized voice. If the agent uses a custom voice you
      # supplied, that voice is kept and only the language changes. When omitted, the
      # agent's configured language is used.
      sig { returns(T.nilable(String)) }
      attr_reader :language

      sig { params(language: String).void }
      attr_writer :language

      # Overrides the agent's maximum call duration for this call only.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_duration_minutes

      sig { params(max_duration_minutes: Integer).void }
      attr_writer :max_duration_minutes

      # Arbitrary metadata to associate with the call. Returned on the call object and
      # included in voice webhooks.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, String]).void }
      attr_writer :metadata

      # Sender profile that places the call. Uses the project's default sender if
      # omitted. The sender's agent must have voice enabled.
      sig { returns(T.nilable(String)) }
      attr_reader :sender_id

      sig { params(sender_id: String).void }
      attr_writer :sender_id

      sig do
        params(
          to: String,
          greeting: String,
          language: String,
          max_duration_minutes: Integer,
          metadata: T::Hash[Symbol, String],
          sender_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Recipient phone number in E.164 format.
        to:,
        # Overrides the agent's configured greeting for this call only.
        greeting: nil,
        # Language the agent speaks on this call only, as a BCP-47 tag (`en`, `es`,
        # `es-ES`, `pt-BR`), or `auto` to detect the caller's language and follow it.
        # Overrides the agent's configured language for speech recognition, the agent's
        # replies, and the synthesized voice. If the agent uses a custom voice you
        # supplied, that voice is kept and only the language changes. When omitted, the
        # agent's configured language is used.
        language: nil,
        # Overrides the agent's maximum call duration for this call only.
        max_duration_minutes: nil,
        # Arbitrary metadata to associate with the call. Returned on the call object and
        # included in voice webhooks.
        metadata: nil,
        # Sender profile that places the call. Uses the project's default sender if
        # omitted. The sender's agent must have voice enabled.
        sender_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            to: String,
            greeting: String,
            language: String,
            max_duration_minutes: Integer,
            metadata: T::Hash[Symbol, String],
            sender_id: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
