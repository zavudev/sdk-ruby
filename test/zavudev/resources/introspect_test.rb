# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::IntrospectTest < Zavudev::Test::ResourceTest
  def test_validate_phone_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.introspect.validate_phone(phone_number: "+56912345678")

    assert_pattern do
      response => Zavudev::Models::IntrospectValidatePhoneResponse
    end

    assert_pattern do
      response => {
        country_code: String,
        phone_number: String,
        valid_number: Zavudev::Internal::Type::Boolean,
        available_channels: ^(Zavudev::Internal::Type::ArrayOf[String]) | nil,
        carrier: Zavudev::Models::IntrospectValidatePhoneResponse::Carrier | nil,
        line_type: Zavudev::LineType | nil,
        national_format: String | nil
      }
    end
  end
end
