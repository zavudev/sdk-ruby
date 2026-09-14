# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Calls#create
    class CallCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute to
      #   Recipient phone number in E.164 format.
      #
      #   @return [String]
      required :to, String

      # @!attribute greeting
      #   Overrides the agent's configured greeting for this call only.
      #
      #   @return [String, nil]
      optional :greeting, String

      # @!attribute language
      #   Language the agent speaks on this call only, as a BCP-47 tag (`en`, `es`,
      #   `es-ES`, `pt-BR`), or `auto` to detect the caller's language and follow it.
      #   Overrides the agent's configured language for speech recognition, the agent's
      #   replies, and the synthesized voice. If the agent uses a custom voice you
      #   supplied, that voice is kept and only the language changes. When omitted, the
      #   agent's configured language is used.
      #
      #   @return [String, nil]
      optional :language, String

      # @!attribute max_duration_minutes
      #   Overrides the agent's maximum call duration for this call only.
      #
      #   @return [Integer, nil]
      optional :max_duration_minutes, Integer, api_name: :maxDurationMinutes

      # @!attribute metadata
      #   Arbitrary metadata to associate with the call. Returned on the call object and
      #   included in voice webhooks.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Zavudev::Internal::Type::HashOf[String]

      # @!attribute sender_id
      #   Sender profile that places the call. Uses the project's default sender if
      #   omitted. The sender's agent must have voice enabled.
      #
      #   @return [String, nil]
      optional :sender_id, String, api_name: :senderId

      # @!method initialize(to:, greeting: nil, language: nil, max_duration_minutes: nil, metadata: nil, sender_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::CallCreateParams} for more details.
      #
      #   @param to [String] Recipient phone number in E.164 format.
      #
      #   @param greeting [String] Overrides the agent's configured greeting for this call only.
      #
      #   @param language [String] Language the agent speaks on this call only, as a BCP-47 tag (`en`, `es`, `es-ES
      #
      #   @param max_duration_minutes [Integer] Overrides the agent's maximum call duration for this call only.
      #
      #   @param metadata [Hash{Symbol=>String}] Arbitrary metadata to associate with the call. Returned on the call object and i
      #
      #   @param sender_id [String] Sender profile that places the call. Uses the project's default sender if omitte
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
