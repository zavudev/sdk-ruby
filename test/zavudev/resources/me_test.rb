# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::MeTest < Zavudev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.me.retrieve

    assert_pattern do
      response => Zavudev::Models::MeRetrieveResponse
    end

    assert_pattern do
      response => {
        api_key: Zavudev::Models::MeRetrieveResponse::APIKey,
        is_test_mode: Zavudev::Internal::Type::Boolean,
        project: Zavudev::Models::MeRetrieveResponse::Project,
        team: Zavudev::Models::MeRetrieveResponse::Team
      }
    end
  end
end
