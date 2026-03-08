# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::AddressesTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.addresses.create(
        country_code: "DE",
        locality: "Berlin",
        postal_code: "10115",
        street_address: "123 Main St"
      )

    assert_pattern do
      response => Zavudev::Models::AddressCreateResponse
    end

    assert_pattern do
      response => {
        address: Zavudev::Address
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.addresses.retrieve("addressId")

    assert_pattern do
      response => Zavudev::Models::AddressRetrieveResponse
    end

    assert_pattern do
      response => {
        address: Zavudev::Address
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.addresses.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Address
    end

    assert_pattern do
      row => {
        id: String,
        country_code: String,
        created_at: Time,
        locality: String,
        postal_code: String,
        status: Zavudev::AddressStatus,
        street_address: String,
        administrative_area: String | nil,
        business_name: String | nil,
        extended_address: String | nil,
        first_name: String | nil,
        last_name: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @zavudev.addresses.delete("addressId")

    assert_pattern do
      response => nil
    end
  end
end
