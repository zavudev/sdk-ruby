# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::FunctionsTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.functions.create(name: "Order Bot", slug: "order-bot")

    assert_pattern do
      response => Zavudev::Models::FunctionCreateResponse
    end

    assert_pattern do
      response => {
        function: Zavudev::Models::FunctionCreateResponse::Function
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.functions.retrieve("functionId")

    assert_pattern do
      response => Zavudev::Models::FunctionRetrieveResponse
    end

    assert_pattern do
      response => {
        function: Zavudev::Models::FunctionRetrieveResponse::Function
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @zavudev.functions.update("functionId")

    assert_pattern do
      response => Zavudev::Models::FunctionUpdateResponse
    end

    assert_pattern do
      response => {
        function: Zavudev::Models::FunctionUpdateResponse::Function
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @zavudev.functions.delete("functionId")

    assert_pattern do
      response => Zavudev::Models::FunctionDeleteResponse
    end

    assert_pattern do
      response => {
        deleted: Zavudev::Internal::Type::Boolean,
        name: String | nil,
        slug: String | nil
      }
    end
  end

  def test_deploy
    skip("Mock server tests are disabled")

    response = @zavudev.functions.deploy("functionId")

    assert_pattern do
      response => Zavudev::Models::FunctionDeployResponse
    end

    assert_pattern do
      response => {
        deployment: Zavudev::Models::FunctionDeployResponse::Deployment
      }
    end
  end

  def test_get_deployment
    skip("Mock server tests are disabled")

    response = @zavudev.functions.get_deployment("deploymentId")

    assert_pattern do
      response => Zavudev::Models::FunctionGetDeploymentResponse
    end

    assert_pattern do
      response => {
        deployment: Zavudev::Models::FunctionGetDeploymentResponse::Deployment
      }
    end
  end

  def test_list_deployments
    skip("Mock server tests are disabled")

    response = @zavudev.functions.list_deployments("functionId")

    assert_pattern do
      response => Zavudev::Models::FunctionListDeploymentsResponse
    end

    assert_pattern do
      response => {
        deployments: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Models::FunctionListDeploymentsResponse::Deployment])
      }
    end
  end

  def test_list_event_types
    skip("Mock server tests are disabled")

    response = @zavudev.functions.list_event_types

    assert_pattern do
      response => Zavudev::Models::FunctionListEventTypesResponse
    end

    assert_pattern do
      response => {
        events: ^(Zavudev::Internal::Type::ArrayOf[String])
      }
    end
  end

  def test_rollback_deployment_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.functions.rollback_deployment("functionId", deployment_id: "fnd_abc123")

    assert_pattern do
      response => Zavudev::Models::FunctionRollbackDeploymentResponse
    end

    assert_pattern do
      response => {
        deployment: Zavudev::Models::FunctionRollbackDeploymentResponse::Deployment,
        previous_draft: Zavudev::Internal::Type::Unknown | nil,
        rolled_back_to_version: Integer | nil
      }
    end
  end

  def test_tail_logs
    skip("Mock server tests are disabled")

    response = @zavudev.functions.tail_logs("functionId")

    assert_pattern do
      response => Zavudev::Models::FunctionTailLogsResponse
    end

    assert_pattern do
      response => {
        events: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Models::FunctionTailLogsResponse::Event]),
        next_token: String | nil
      }
    end
  end
end
