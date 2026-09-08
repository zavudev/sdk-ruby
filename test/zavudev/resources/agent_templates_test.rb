# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::AgentTemplatesTest < Zavudev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.agent_templates.retrieve("fermi")

    assert_pattern do
      response => Zavudev::Models::AgentTemplateRetrieveResponse
    end

    assert_pattern do
      response => {
        template: Zavudev::Models::AgentTemplateRetrieveResponse::Template
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.agent_templates.list

    assert_pattern do
      response => Zavudev::Models::AgentTemplateListResponse
    end

    assert_pattern do
      response => {
        items: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Models::AgentTemplateListResponse::Item])
      }
    end
  end
end
