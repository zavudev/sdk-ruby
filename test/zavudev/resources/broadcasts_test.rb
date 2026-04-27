# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::BroadcastsTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.broadcasts.create(channel: :sms, name: "Black Friday Sale")

    assert_pattern do
      response => Zavudev::Models::BroadcastCreateResponse
    end

    assert_pattern do
      response => {
        broadcast: Zavudev::Broadcast
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.broadcasts.retrieve("broadcastId")

    assert_pattern do
      response => Zavudev::Models::BroadcastRetrieveResponse
    end

    assert_pattern do
      response => {
        broadcast: Zavudev::Broadcast
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @zavudev.broadcasts.update("broadcastId")

    assert_pattern do
      response => Zavudev::Models::BroadcastUpdateResponse
    end

    assert_pattern do
      response => {
        broadcast: Zavudev::Broadcast
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.broadcasts.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Broadcast
    end

    assert_pattern do
      row => {
        id: String,
        channel: Zavudev::BroadcastChannel,
        created_at: Time,
        message_type: Zavudev::BroadcastMessageType,
        name: String,
        status: Zavudev::BroadcastStatus,
        total_contacts: Integer,
        actual_cost: Float | nil,
        completed_at: Time | nil,
        content: Zavudev::BroadcastContent | nil,
        delivered_count: Integer | nil,
        email_subject: String | nil,
        estimated_cost: Float | nil,
        failed_count: Integer | nil,
        metadata: ^(Zavudev::Internal::Type::HashOf[String]) | nil,
        pending_count: Integer | nil,
        reserved_amount: Float | nil,
        review_attempts: Integer | nil,
        review_result: Zavudev::Broadcast::ReviewResult | nil,
        scheduled_at: Time | nil,
        sender_id: String | nil,
        sending_count: Integer | nil,
        started_at: Time | nil,
        text: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @zavudev.broadcasts.delete("broadcastId")

    assert_pattern do
      response => nil
    end
  end

  def test_cancel
    skip("Mock server tests are disabled")

    response = @zavudev.broadcasts.cancel("broadcastId")

    assert_pattern do
      response => Zavudev::Models::BroadcastCancelResponse
    end

    assert_pattern do
      response => {
        broadcast: Zavudev::Broadcast
      }
    end
  end

  def test_escalate_review
    skip("Mock server tests are disabled")

    response = @zavudev.broadcasts.escalate_review("broadcastId")

    assert_pattern do
      response => Zavudev::Models::BroadcastEscalateReviewResponse
    end

    assert_pattern do
      response => {
        broadcast: Zavudev::Broadcast
      }
    end
  end

  def test_progress
    skip("Mock server tests are disabled")

    response = @zavudev.broadcasts.progress("broadcastId")

    assert_pattern do
      response => Zavudev::BroadcastProgress
    end

    assert_pattern do
      response => {
        broadcast_id: String,
        delivered: Integer,
        failed: Integer,
        pending: Integer,
        percent_complete: Float,
        sending: Integer,
        skipped: Integer,
        status: Zavudev::BroadcastStatus,
        total: Integer,
        actual_cost: Float | nil,
        estimated_completion_at: Time | nil,
        estimated_cost: Float | nil,
        reserved_amount: Float | nil,
        started_at: Time | nil
      }
    end
  end

  def test_reschedule_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.broadcasts.reschedule("broadcastId", scheduled_at: "2024-01-15T14:00:00Z")

    assert_pattern do
      response => Zavudev::Models::BroadcastRescheduleResponse
    end

    assert_pattern do
      response => {
        broadcast: Zavudev::Broadcast
      }
    end
  end

  def test_retry_review
    skip("Mock server tests are disabled")

    response = @zavudev.broadcasts.retry_review("broadcastId")

    assert_pattern do
      response => Zavudev::Models::BroadcastRetryReviewResponse
    end

    assert_pattern do
      response => {
        broadcast: Zavudev::Broadcast
      }
    end
  end

  def test_send_
    skip("Mock server tests are disabled")

    response = @zavudev.broadcasts.send_("broadcastId")

    assert_pattern do
      response => Zavudev::Models::BroadcastSendResponse
    end

    assert_pattern do
      response => {
        broadcast: Zavudev::Broadcast
      }
    end
  end
end
