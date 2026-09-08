# frozen_string_literal: true

module Zavudev
  module Resources
    class Calls
      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::CallCreateParams} for more details.
      #
      # Place an outbound voice call answered by the voice agent configured on the
      # sender. Zavu dials the recipient and runs the conversation through its managed
      # voice pipeline (speech recognition, the agent's LLM, and speech synthesis, with
      # real-time interruption handling).
      #
      # **Requirements:**
      #
      # - The Voice Agents feature must be enabled for your team (otherwise `403`).
      # - An account that has verified nothing may only call the phone numbers the
      #   project has verified (`403` with code `destination_not_verified`, and
      #   `details.verifiedNumbers` lists them), and at most 5 calls a day (`429` with
      #   code `daily_limit_exceeded`). A number is verified from the dashboard's
      #   Sandbox screen by sending the pre-filled WhatsApp message from that phone; the
      #   same verification covers SMS and calls. Verify your identity, add a payment
      #   method, settle a deposit or subscribe to call any destination. That raises the
      #   ceiling to 50 calls a day on Free; paid plans have no daily call ceiling. Full
      #   reference: https://docs.zavu.dev/concepts/sending-limits
      # - The sender's agent must have `voice.enabled` set to `true`.
      # - Not available with test-mode API keys.
      #
      # **Billing:** Voice calls are billed per minute of connected time plus telephony,
      # deducted from your prepaid balance. A short-duration estimate is reserved when
      # the call is placed; you are charged for the actual duration when the call ends.
      #
      # @overload create(to:, greeting: nil, language: nil, max_duration_minutes: nil, metadata: nil, sender_id: nil, request_options: {})
      #
      # @param to [String] Recipient phone number in E.164 format.
      #
      # @param greeting [String] Overrides the agent's configured greeting for this call only.
      #
      # @param language [String] Language the agent speaks on this call only, as a BCP-47 tag (`en`, `es`, `es-ES
      #
      # @param max_duration_minutes [Integer] Overrides the agent's maximum call duration for this call only.
      #
      # @param metadata [Hash{Symbol=>String}] Arbitrary metadata to associate with the call. Returned on the call object and i
      #
      # @param sender_id [String] Sender profile that places the call. Uses the project's default sender if omitte
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::CallCreateResponse]
      #
      # @see Zavudev::Models::CallCreateParams
      def create(params)
        parsed, options = Zavudev::CallCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/calls",
          body: parsed,
          model: Zavudev::Models::CallCreateResponse,
          options: options
        )
      end

      # Retrieve a single voice call, including its full transcript once the
      # conversation has produced turns.
      #
      # @overload retrieve(call_id, request_options: {})
      #
      # @param call_id [String] Voice call ID.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::CallRetrieveResponse]
      #
      # @see Zavudev::Models::CallRetrieveParams
      def retrieve(call_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/calls/%1$s", call_id],
          model: Zavudev::Models::CallRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::CallListParams} for more details.
      #
      # List voice calls for this project, most recent first. Transcripts are omitted
      # from the list; fetch a single call to get its transcript.
      #
      # @overload list(cursor: nil, direction: nil, limit: nil, status: nil, request_options: {})
      #
      # @param cursor [String]
      #
      # @param direction [Symbol, Zavudev::Models::CallListParams::Direction] Whether the call was placed by Zavu (outbound) or received from a caller (inboun
      #
      # @param limit [Integer]
      #
      # @param status [Symbol, Zavudev::Models::CallListParams::Status] Lifecycle status of a voice call.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::CallListResponse>]
      #
      # @see Zavudev::Models::CallListParams
      def list(params = {})
        parsed, options = Zavudev::CallListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/calls",
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::Models::CallListResponse,
          options: options
        )
      end

      # End an active voice call. The call must still be ringing or in progress. Not
      # available with test-mode API keys.
      #
      # @overload hangup(call_id, request_options: {})
      #
      # @param call_id [String] Voice call ID.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::CallHangupResponse]
      #
      # @see Zavudev::Models::CallHangupParams
      def hangup(call_id, params = {})
        @client.request(
          method: :post,
          path: ["v1/calls/%1$s/hangup", call_id],
          model: Zavudev::Models::CallHangupResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Zavudev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
