# typed: strong

module Zavudev
  module Resources
    class Calls
      # Place an outbound voice call answered by the voice agent configured on the
      # sender. Zavu dials the recipient and runs the conversation through its managed
      # voice pipeline (speech recognition, the agent's LLM, and speech synthesis, with
      # real-time interruption handling).
      #
      # **Requirements:**
      #
      # - The Voice Agents feature must be enabled for your team (otherwise `403`).
      # - The sender's agent must have `voice.enabled` set to `true`.
      # - Not available with test-mode API keys.
      #
      # **Billing:** Voice calls are billed per minute of connected time plus telephony,
      # deducted from your prepaid balance. A short-duration estimate is reserved when
      # the call is placed; you are charged for the actual duration when the call ends.
      sig do
        params(
          to: String,
          greeting: String,
          language: String,
          max_duration_minutes: Integer,
          metadata: T::Hash[Symbol, String],
          sender_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::CallCreateResponse)
      end
      def create(
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

      # Retrieve a single voice call, including its full transcript once the
      # conversation has produced turns.
      sig do
        params(
          call_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::CallRetrieveResponse)
      end
      def retrieve(
        # Voice call ID.
        call_id,
        request_options: {}
      )
      end

      # List voice calls for this project, most recent first. Transcripts are omitted
      # from the list; fetch a single call to get its transcript.
      sig do
        params(
          cursor: String,
          direction: Zavudev::CallListParams::Direction::OrSymbol,
          limit: Integer,
          status: Zavudev::CallListParams::Status::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::Models::CallListResponse])
      end
      def list(
        cursor: nil,
        # Whether the call was placed by Zavu (outbound) or received from a caller
        # (inbound).
        direction: nil,
        limit: nil,
        # Lifecycle status of a voice call.
        #
        # - `queued`: outbound call created, not yet dialing.
        # - `ringing`: dialing (outbound) or received and ringing (inbound).
        # - `in_progress`: answered, the agent is connected.
        # - `completed`: ended after a conversation.
        # - `failed`: could not be completed.
        # - `busy`: the line was busy.
        # - `no_answer`: rang but was not answered.
        # - `canceled`: canceled before it was answered.
        status: nil,
        request_options: {}
      )
      end

      # End an active voice call. The call must still be ringing or in progress. Not
      # available with test-mode API keys.
      sig do
        params(
          call_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::CallHangupResponse)
      end
      def hangup(
        # Voice call ID.
        call_id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
