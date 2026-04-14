# frozen_string_literal: true

require_relative "../../test_helper"

class Zavudev::Test::Resources::Contacts::ChannelsTest < Zavudev::Test::ResourceTest
  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.contacts.channels.update("channelId", contact_id: "contactId")

    assert_pattern do
      response => Zavudev::Models::Contacts::ChannelUpdateResponse
    end

    assert_pattern do
      response => {
        channel: Zavudev::ContactChannel
      }
    end
  end

  def test_add_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.contacts.channels.add("contactId", channel: :email, identifier: "john.work@company.com")

    assert_pattern do
      response => Zavudev::Models::Contacts::ChannelAddResponse
    end

    assert_pattern do
      response => {
        channel: Zavudev::ContactChannel
      }
    end
  end

  def test_remove_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.contacts.channels.remove("channelId", contact_id: "contactId")

    assert_pattern do
      response => nil
    end
  end

  def test_set_primary_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.contacts.channels.set_primary("channelId", contact_id: "contactId")

    assert_pattern do
      response => Zavudev::Models::Contacts::ChannelSetPrimaryResponse
    end

    assert_pattern do
      response => {
        channel: Zavudev::ContactChannel
      }
    end
  end
end
