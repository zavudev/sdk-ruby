# frozen_string_literal: true

require_relative "../../test_helper"

class Zavudev::Test::Resources::Functions::TriggersTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.functions.triggers.create("functionId", event_types: ["message.inbound"], sender_ids: [nil])

    assert_pattern do
      response => Zavudev::Models::Functions::TriggerCreateResponse
    end

    assert_pattern do
      response => {
        added: Integer,
        skipped: Integer,
        triggers: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Models::Functions::TriggerCreateResponse::Trigger])
      }
    end
  end

  def test_update_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.functions.triggers.update("triggerId", active: true)

    assert_pattern do
      response => Zavudev::Models::Functions::TriggerUpdateResponse
    end

    assert_pattern do
      response => {
        active: Zavudev::Internal::Type::Boolean,
        ok: Zavudev::Internal::Type::Boolean
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.functions.triggers.list("functionId")

    assert_pattern do
      response => Zavudev::Models::Functions::TriggerListResponse
    end

    assert_pattern do
      response => {
        triggers: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Models::Functions::TriggerListResponse::Trigger])
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @zavudev.functions.triggers.delete("triggerId")

    assert_pattern do
      response => nil
    end
  end
end
