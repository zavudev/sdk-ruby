# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::CallsTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.calls.create(to: "+56912345678")

    assert_pattern do
      response => Zavudev::Models::CallCreateResponse
    end

    assert_pattern do
      response => {
        call: Zavudev::Models::CallCreateResponse::Call
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.calls.retrieve("callId")

    assert_pattern do
      response => Zavudev::Models::CallRetrieveResponse
    end

    assert_pattern do
      response => {
        call: Zavudev::Models::CallRetrieveResponse::Call
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.calls.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Models::CallListResponse
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        direction: Zavudev::Models::CallListResponse::Direction,
        from: String,
        status: Zavudev::Models::CallListResponse::Status,
        to: String,
        answered_at: Time | nil,
        cost: Float | nil,
        duration_seconds: Integer | nil,
        ended_at: Time | nil,
        end_reason: String | nil,
        metadata: ^(Zavudev::Internal::Type::HashOf[String]) | nil,
        transcript: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Models::CallListResponse::Transcript]) | nil,
        turn_count: Integer | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_hangup
    skip("Mock server tests are disabled")

    response = @zavudev.calls.hangup("callId")

    assert_pattern do
      response => Zavudev::Models::CallHangupResponse
    end

    assert_pattern do
      response => {
        call: Zavudev::Models::CallHangupResponse::Call
      }
    end
  end
end
