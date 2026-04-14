# frozen_string_literal: true

require_relative "../../test_helper"

class Zavudev::Test::Resources::Number10dlc::BrandsTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.number_10dlc.brands.create(
        city: "San Francisco",
        country: "US",
        display_name: "Acme Corp",
        email: "compliance@acme.com",
        entity_type: :PRIVATE_PROFIT,
        phone: "+14155551234",
        postal_code: "94102",
        state: "CA",
        street: "123 Main St",
        vertical: "Technology"
      )

    assert_pattern do
      response => Zavudev::Models::Number10dlc::BrandCreateResponse
    end

    assert_pattern do
      response => {
        brand: Zavudev::Number10dlc::TenDlcBrand
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.brands.retrieve("brandId")

    assert_pattern do
      response => Zavudev::Models::Number10dlc::BrandRetrieveResponse
    end

    assert_pattern do
      response => {
        brand: Zavudev::Number10dlc::TenDlcBrand
      }
    end
  end

  def test_update
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.brands.update("brandId")

    assert_pattern do
      response => Zavudev::Models::Number10dlc::BrandUpdateResponse
    end

    assert_pattern do
      response => {
        brand: Zavudev::Number10dlc::TenDlcBrand
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.brands.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::Number10dlc::TenDlcBrand
    end

    assert_pattern do
      row => {
        id: String,
        city: String,
        country: String,
        created_at: Time,
        display_name: String,
        email: String,
        entity_type: Zavudev::Number10dlc::TenDlcBrand::EntityType,
        phone: String,
        postal_code: String,
        state: String,
        status: Zavudev::Number10dlc::TenDlcBrand::Status,
        street: String,
        updated_at: Time,
        vertical: String,
        brand_relationship: String | nil,
        brand_score: Integer | nil,
        company_name: String | nil,
        ein: String | nil,
        failure_reason: String | nil,
        first_name: String | nil,
        last_name: String | nil,
        stock_exchange: String | nil,
        stock_symbol: String | nil,
        submitted_at: Time | nil,
        verified_at: Time | nil,
        website: String | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.brands.delete("brandId")

    assert_pattern do
      response => nil
    end
  end

  def test_list_use_cases
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.brands.list_use_cases

    assert_pattern do
      response => Zavudev::Models::Number10dlc::BrandListUseCasesResponse
    end

    assert_pattern do
      response => {
        use_cases: ^(Zavudev::Internal::Type::ArrayOf[Zavudev::Models::Number10dlc::BrandListUseCasesResponse::UseCase])
      }
    end
  end

  def test_submit
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.brands.submit("brandId")

    assert_pattern do
      response => Zavudev::Models::Number10dlc::BrandSubmitResponse
    end

    assert_pattern do
      response => {
        brand: Zavudev::Number10dlc::TenDlcBrand
      }
    end
  end

  def test_sync_status
    skip("Mock server tests are disabled")

    response = @zavudev.number_10dlc.brands.sync_status("brandId")

    assert_pattern do
      response => Zavudev::Models::Number10dlc::BrandSyncStatusResponse
    end

    assert_pattern do
      response => {
        brand: Zavudev::Number10dlc::TenDlcBrand
      }
    end
  end
end
