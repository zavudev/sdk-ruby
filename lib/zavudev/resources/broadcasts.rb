# frozen_string_literal: true

module Zavudev
  module Resources
    class Broadcasts
      # @return [Zavudev::Resources::Broadcasts::Contacts]
      attr_reader :contacts

      # Create a new broadcast campaign. Add contacts after creation, then send.
      #
      # @overload create(channel:, name:, content: nil, email_html_body: nil, email_subject: nil, idempotency_key: nil, message_type: nil, metadata: nil, scheduled_at: nil, sender_id: nil, text: nil, request_options: {})
      #
      # @param channel [Symbol, Zavudev::Models::BroadcastChannel] Broadcast delivery channel. Use 'smart' for per-contact intelligent routing.
      #
      # @param name [String] Name of the broadcast campaign.
      #
      # @param content [Zavudev::Models::BroadcastContent] Content for non-text broadcast message types.
      #
      # @param email_html_body [String] HTML body for email broadcasts.
      #
      # @param email_subject [String] Email subject line. Required for email broadcasts.
      #
      # @param idempotency_key [String] Idempotency key to prevent duplicate broadcasts.
      #
      # @param message_type [Symbol, Zavudev::Models::BroadcastMessageType] Type of message for broadcast.
      #
      # @param metadata [Hash{Symbol=>String}]
      #
      # @param scheduled_at [Time] Schedule the broadcast for future delivery.
      #
      # @param sender_id [String] Sender profile ID. Uses default sender if omitted.
      #
      # @param text [String] Text content or caption. Supports template variables: {{name}}, {{1}}, etc.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::BroadcastCreateResponse]
      #
      # @see Zavudev::Models::BroadcastCreateParams
      def create(params)
        parsed, options = Zavudev::BroadcastCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/broadcasts",
          body: parsed,
          model: Zavudev::Models::BroadcastCreateResponse,
          options: options
        )
      end

      # Get broadcast
      #
      # @overload retrieve(broadcast_id, request_options: {})
      #
      # @param broadcast_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::BroadcastRetrieveResponse]
      #
      # @see Zavudev::Models::BroadcastRetrieveParams
      def retrieve(broadcast_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/broadcasts/%1$s", broadcast_id],
          model: Zavudev::Models::BroadcastRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Update a broadcast in draft status.
      #
      # @overload update(broadcast_id, content: nil, email_html_body: nil, email_subject: nil, metadata: nil, name: nil, text: nil, request_options: {})
      #
      # @param broadcast_id [String]
      #
      # @param content [Zavudev::Models::BroadcastContent] Content for non-text broadcast message types.
      #
      # @param email_html_body [String]
      #
      # @param email_subject [String]
      #
      # @param metadata [Hash{Symbol=>String}]
      #
      # @param name [String]
      #
      # @param text [String]
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::BroadcastUpdateResponse]
      #
      # @see Zavudev::Models::BroadcastUpdateParams
      def update(broadcast_id, params = {})
        parsed, options = Zavudev::BroadcastUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/broadcasts/%1$s", broadcast_id],
          body: parsed,
          model: Zavudev::Models::BroadcastUpdateResponse,
          options: options
        )
      end

      # List broadcasts for this project.
      #
      # @overload list(cursor: nil, limit: nil, status: nil, request_options: {})
      #
      # @param cursor [String]
      #
      # @param limit [Integer]
      #
      # @param status [Symbol, Zavudev::Models::BroadcastStatus] Current status of the broadcast.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Internal::Cursor<Zavudev::Models::Broadcast>]
      #
      # @see Zavudev::Models::BroadcastListParams
      def list(params = {})
        parsed, options = Zavudev::BroadcastListParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/broadcasts",
          query: query,
          page: Zavudev::Internal::Cursor,
          model: Zavudev::Broadcast,
          options: options
        )
      end

      # Delete a broadcast in draft status.
      #
      # @overload delete(broadcast_id, request_options: {})
      #
      # @param broadcast_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Zavudev::Models::BroadcastDeleteParams
      def delete(broadcast_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/broadcasts/%1$s", broadcast_id],
          model: NilClass,
          options: params[:request_options]
        )
      end

      # Cancel a broadcast. Pending contacts will be skipped, but already queued
      # messages may still be delivered.
      #
      # @overload cancel(broadcast_id, request_options: {})
      #
      # @param broadcast_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::BroadcastCancelResponse]
      #
      # @see Zavudev::Models::BroadcastCancelParams
      def cancel(broadcast_id, params = {})
        @client.request(
          method: :post,
          path: ["v1/broadcasts/%1$s/cancel", broadcast_id],
          model: Zavudev::Models::BroadcastCancelResponse,
          options: params[:request_options]
        )
      end

      # Request manual review by the Zavu team for a rejected broadcast. Use this after
      # automated review rejection if you believe the content is legitimate.
      #
      # @overload escalate_review(broadcast_id, request_options: {})
      #
      # @param broadcast_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::BroadcastEscalateReviewResponse]
      #
      # @see Zavudev::Models::BroadcastEscalateReviewParams
      def escalate_review(broadcast_id, params = {})
        @client.request(
          method: :post,
          path: ["v1/broadcasts/%1$s/escalate", broadcast_id],
          model: Zavudev::Models::BroadcastEscalateReviewResponse,
          options: params[:request_options]
        )
      end

      # Get real-time progress of a broadcast including delivery counts and estimated
      # completion time.
      #
      # @overload progress(broadcast_id, request_options: {})
      #
      # @param broadcast_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::BroadcastProgress]
      #
      # @see Zavudev::Models::BroadcastProgressParams
      def progress(broadcast_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/broadcasts/%1$s/progress", broadcast_id],
          model: Zavudev::BroadcastProgress,
          options: params[:request_options]
        )
      end

      # Update the scheduled time for a broadcast. The broadcast must be in scheduled
      # status.
      #
      # @overload reschedule(broadcast_id, scheduled_at:, request_options: {})
      #
      # @param broadcast_id [String]
      #
      # @param scheduled_at [Time] New scheduled time for the broadcast.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::BroadcastRescheduleResponse]
      #
      # @see Zavudev::Models::BroadcastRescheduleParams
      def reschedule(broadcast_id, params)
        parsed, options = Zavudev::BroadcastRescheduleParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/broadcasts/%1$s/schedule", broadcast_id],
          body: parsed,
          model: Zavudev::Models::BroadcastRescheduleResponse,
          options: options
        )
      end

      # Resubmit a rejected broadcast for AI review after editing content. Maximum 3
      # review attempts allowed per broadcast.
      #
      # @overload retry_review(broadcast_id, request_options: {})
      #
      # @param broadcast_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::BroadcastRetryReviewResponse]
      #
      # @see Zavudev::Models::BroadcastRetryReviewParams
      def retry_review(broadcast_id, params = {})
        @client.request(
          method: :post,
          path: ["v1/broadcasts/%1$s/retry-review", broadcast_id],
          model: Zavudev::Models::BroadcastRetryReviewResponse,
          options: params[:request_options]
        )
      end

      # Start sending the broadcast immediately or schedule for later. Broadcasts go
      # through automated AI content review before sending. If the review passes, the
      # broadcast proceeds. If rejected, use PATCH to edit content, then call POST
      # /retry-review. Reserves the estimated cost from your balance.
      #
      # @overload send_(broadcast_id, scheduled_at: nil, request_options: {})
      #
      # @param broadcast_id [String]
      #
      # @param scheduled_at [Time] Schedule for future delivery. Omit to send immediately.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::BroadcastSendResponse]
      #
      # @see Zavudev::Models::BroadcastSendParams
      def send_(broadcast_id, params = {})
        parsed, options = Zavudev::BroadcastSendParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/broadcasts/%1$s/send", broadcast_id],
          body: parsed,
          model: Zavudev::Models::BroadcastSendResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Zavudev::Client]
      def initialize(client:)
        @client = client
        @contacts = Zavudev::Resources::Broadcasts::Contacts.new(client: client)
      end
    end
  end
end
