# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::EmailDomainsTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.email_domains.create(domain: "example.com")

    assert_pattern do
      response => Zavudev::Models::EmailDomainCreateResponse
    end

    assert_pattern do
      response => {
        domain: Zavudev::Models::EmailDomainCreateResponse::Domain
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.email_domains.retrieve("domainId")

    assert_pattern do
      response => Zavudev::Models::EmailDomainRetrieveResponse
    end

    assert_pattern do
      response => {
        domain: Zavudev::Models::EmailDomainRetrieveResponse::Domain
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.email_domains.list

    assert_pattern do
      response => Zavudev::Models::EmailDomainListResponse
    end

    assert_pattern do
      response => {
        items: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Models::EmailDomainListResponse::Item])
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @zavudev.email_domains.delete("domainId")

    assert_pattern do
      response => nil
    end
  end

  def test_verify
    skip("Mock server tests are disabled")

    response = @zavudev.email_domains.verify("domainId")

    assert_pattern do
      response => Zavudev::Models::EmailDomainVerifyResponse
    end

    assert_pattern do
      response => {
        domain: Zavudev::Models::EmailDomainVerifyResponse::Domain
      }
    end
  end
end
