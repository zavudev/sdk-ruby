# typed: strong

module Zavudev
  module Resources
    class Broadcasts
      sig { returns(Zavudev::Resources::Broadcasts::Contacts) }
      attr_reader :contacts

      # Create a new broadcast campaign. Add contacts after creation, then send.
      sig do
        params(
          channel: Zavudev::BroadcastChannel::OrSymbol,
          name: String,
          content: Zavudev::BroadcastContent::OrHash,
          email_html_body: String,
          email_subject: String,
          idempotency_key: String,
          message_type: Zavudev::BroadcastMessageType::OrSymbol,
          metadata: T::Hash[Symbol, String],
          scheduled_at: Time,
          sender_id: String,
          text: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::BroadcastCreateResponse)
      end
      def create(
        # Broadcast delivery channel. Use 'smart' for per-contact intelligent routing.
        channel:,
        # Name of the broadcast campaign.
        name:,
        # Content for non-text broadcast message types.
        content: nil,
        # HTML body for email broadcasts.
        email_html_body: nil,
        # Email subject line. Required for email broadcasts.
        email_subject: nil,
        # Idempotency key to prevent duplicate broadcasts.
        idempotency_key: nil,
        # Type of message for broadcast.
        message_type: nil,
        metadata: nil,
        # Schedule the broadcast for future delivery.
        scheduled_at: nil,
        # Sender profile ID. Uses default sender if omitted.
        sender_id: nil,
        # Text content or caption. Supports template variables: {{name}}, {{1}}, etc.
        text: nil,
        request_options: {}
      )
      end

      # Get broadcast
      sig do
        params(
          broadcast_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::BroadcastRetrieveResponse)
      end
      def retrieve(broadcast_id, request_options: {})
      end

      # Update a broadcast in draft status.
      sig do
        params(
          broadcast_id: String,
          content: Zavudev::BroadcastContent::OrHash,
          email_html_body: String,
          email_subject: String,
          metadata: T::Hash[Symbol, String],
          name: String,
          text: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::BroadcastUpdateResponse)
      end
      def update(
        broadcast_id,
        # Content for non-text broadcast message types.
        content: nil,
        email_html_body: nil,
        email_subject: nil,
        metadata: nil,
        name: nil,
        text: nil,
        request_options: {}
      )
      end

      # List broadcasts for this project.
      sig do
        params(
          cursor: String,
          limit: Integer,
          status: Zavudev::BroadcastStatus::OrSymbol,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Internal::Cursor[Zavudev::Broadcast])
      end
      def list(
        cursor: nil,
        limit: nil,
        # Current status of the broadcast.
        status: nil,
        request_options: {}
      )
      end

      # Delete a broadcast in draft status.
      sig do
        params(
          broadcast_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).void
      end
      def delete(broadcast_id, request_options: {})
      end

      # Cancel a broadcast. Pending contacts will be skipped, but already queued
      # messages may still be delivered.
      sig do
        params(
          broadcast_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::BroadcastCancelResponse)
      end
      def cancel(broadcast_id, request_options: {})
      end

      # Get real-time progress of a broadcast including delivery counts and estimated
      # completion time.
      sig do
        params(
          broadcast_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::BroadcastProgress)
      end
      def progress(broadcast_id, request_options: {})
      end

      # Update the scheduled time for a broadcast. The broadcast must be in scheduled
      # status.
      sig do
        params(
          broadcast_id: String,
          scheduled_at: Time,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::BroadcastRescheduleResponse)
      end
      def reschedule(
        broadcast_id,
        # New scheduled time for the broadcast.
        scheduled_at:,
        request_options: {}
      )
      end

      # Start sending the broadcast immediately or schedule for later. Broadcasts go
      # through automated AI content review before sending. If the review passes, the
      # broadcast proceeds. If rejected, use PATCH to edit content, then call POST
      # /retry-review. Reserves the estimated cost from your balance.
      sig do
        params(
          broadcast_id: String,
          scheduled_at: Time,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::BroadcastSendResponse)
      end
      def send_(
        broadcast_id,
        # Schedule for future delivery. Omit to send immediately.
        scheduled_at: nil,
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
