# frozen_string_literal: true

require_relative "../../test_helper"

class Zavudev::Test::Resources::Senders::WhatsappSyncTest < Zavudev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.senders.whatsapp_sync.retrieve("senderId")

    assert_pattern do
      response => Zavudev::Models::Senders::WhatsappSyncRetrieveResponse
    end

    assert_pattern do
      response => {
        sync: Zavudev::Senders::WhatsAppSyncStatus
      }
    end
  end

  def test_start_contacts_sync
    skip("Mock server tests are disabled")

    response = @zavudev.senders.whatsapp_sync.start_contacts_sync("senderId")

    assert_pattern do
      response => Zavudev::Models::Senders::WhatsappSyncStartContactsSyncResponse
    end

    assert_pattern do
      response => {
        message: String,
        sync: Zavudev::Senders::WhatsAppSyncStatus
      }
    end
  end

  def test_start_history_sync
    skip("Mock server tests are disabled")

    response = @zavudev.senders.whatsapp_sync.start_history_sync("senderId")

    assert_pattern do
      response => Zavudev::Models::Senders::WhatsappSyncStartHistorySyncResponse
    end

    assert_pattern do
      response => {
        message: String,
        sync: Zavudev::Senders::WhatsAppSyncStatus
      }
    end
  end
end
