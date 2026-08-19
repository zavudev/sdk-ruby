# frozen_string_literal: true

require_relative "../../test_helper"

class Zavudev::Test::Resources::Functions::GitLinkTest < Zavudev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.functions.git_link.retrieve("functionId")

    assert_pattern do
      response => Zavudev::Models::Functions::GitLinkRetrieveResponse
    end

    assert_pattern do
      response => {
        link: Zavudev::Models::Functions::GitLinkRetrieveResponse::Link,
        webhook_url: String,
        webhook_secret: String | nil
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @zavudev.functions.git_link.update("functionId")

    assert_pattern do
      response => Zavudev::Models::Functions::GitLinkUpdateResponse
    end

    assert_pattern do
      response => {
        link: Zavudev::Models::Functions::GitLinkUpdateResponse::Link,
        webhook_url: String,
        webhook_secret: String | nil
      }
    end
  end

  def test_deploy_now
    skip("Mock server tests are disabled")

    response = @zavudev.functions.git_link.deploy_now("functionId")

    assert_pattern do
      response => Zavudev::Models::Functions::GitLinkDeployNowResponse
    end

    assert_pattern do
      response => {
        scheduled: Zavudev::Internal::Type::Boolean
      }
    end
  end

  def test_link_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.functions.git_link.link("functionId", owner: "acme", repo: "order-bot")

    assert_pattern do
      response => Zavudev::Models::Functions::GitLinkLinkResponse
    end

    assert_pattern do
      response => {
        link: Zavudev::Models::Functions::GitLinkLinkResponse::Link,
        webhook_url: String,
        webhook_secret: String | nil
      }
    end
  end

  def test_unlink
    skip("Mock server tests are disabled")

    response = @zavudev.functions.git_link.unlink("functionId")

    assert_pattern do
      response => nil
    end
  end
end
