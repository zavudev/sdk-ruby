# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::InvitationsTest < Zavudev::Test::ResourceTest
  def test_create
    skip("Mock server tests are disabled")

    response = @zavudev.invitations.create

    assert_pattern do
      response => Zavudev::Models::InvitationCreateResponse
    end

    assert_pattern do
      response => {
        invitation: Zavudev::Invitation
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.invitations.retrieve("invitationId")

    assert_pattern do
      response => Zavudev::Models::InvitationRetrieveResponse
    end

    assert_pattern do
      response => {
        invitation: Zavudev::Invitation
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.invitations.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Invitation
    end

    assert_pattern do
      row => {
        id: String,
        token: String,
        created_at: Time,
        expires_at: Time,
        status: Zavudev::Invitation::Status,
        updated_at: Time,
        url: String,
        client_email: String | nil,
        client_name: String | nil,
        client_phone: String | nil,
        completed_at: Time | nil,
        phone_number_id: String | nil,
        sender_id: String | nil,
        started_at: Time | nil,
        viewed_at: Time | nil
      }
    end
  end

  def test_cancel
    skip("Mock server tests are disabled")

    response = @zavudev.invitations.cancel("invitationId")

    assert_pattern do
      response => Zavudev::Models::InvitationCancelResponse
    end

    assert_pattern do
      response => {
        invitation: Zavudev::Invitation
      }
    end
  end
end
