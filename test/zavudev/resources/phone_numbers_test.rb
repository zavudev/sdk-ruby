# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::PhoneNumbersTest < Zavudev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.phone_numbers.retrieve("phoneNumberId")

    assert_pattern do
      response => Zavudev::Models::PhoneNumberRetrieveResponse
    end

    assert_pattern do
      response => {
        phone_number: Zavudev::OwnedPhoneNumber
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @zavudev.phone_numbers.update("phoneNumberId")

    assert_pattern do
      response => Zavudev::Models::PhoneNumberUpdateResponse
    end

    assert_pattern do
      response => {
        phone_number: Zavudev::OwnedPhoneNumber
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.phone_numbers.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::OwnedPhoneNumber
    end

    assert_pattern do
      row => {
        id: String,
        capabilities: ^(Zavudev::Internal::Type::ArrayOf[String]),
        created_at: Time,
        phone_number: String,
        pricing: Zavudev::OwnedPhoneNumberPricing,
        status: Zavudev::PhoneNumberStatus,
        name: String | nil,
        next_renewal_date: Time | nil,
        sender_id: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_purchase_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.phone_numbers.purchase(phone_number: "+15551234567")

    assert_pattern do
      response => Zavudev::Models::PhoneNumberPurchaseResponse
    end

    assert_pattern do
      response => {
        phone_number: Zavudev::OwnedPhoneNumber
      }
    end
  end

  def test_release
    skip("Mock server tests are disabled")

    response = @zavudev.phone_numbers.release("phoneNumberId")

    assert_pattern do
      response => nil
    end
  end

  def test_requirements_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.phone_numbers.requirements(country_code: "xx")

    assert_pattern do
      response => Zavudev::Models::PhoneNumberRequirementsResponse
    end

    assert_pattern do
      response => {
        items: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Requirement])
      }
    end
  end

  def test_search_available_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.phone_numbers.search_available(country_code: "xx")

    assert_pattern do
      response => Zavudev::Models::PhoneNumberSearchAvailableResponse
    end

    assert_pattern do
      response => {
        items: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::AvailablePhoneNumber])
      }
    end
  end
end
