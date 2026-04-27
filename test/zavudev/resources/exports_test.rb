# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::ExportsTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @zavudev.exports.create(data_types: [:messages, :conversations])

    assert_pattern do
      response => Zavudev::Models::ExportCreateResponse
    end

    assert_pattern do
      response => {
        export: Zavudev::DataExport
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.exports.retrieve("exportId")

    assert_pattern do
      response => Zavudev::Models::ExportRetrieveResponse
    end

    assert_pattern do
      response => {
        export: Zavudev::DataExport
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.exports.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::DataExport
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        data_types: ^(Zavudev::Internal::Type::ArrayOf[enum: Zavudev::DataExport::DataType]),
        expires_at: Time,
        status: Zavudev::DataExport::Status,
        completed_at: Time | nil,
        date_from: Time | nil,
        date_to: Time | nil,
        download_url: String | nil,
        error_message: String | nil,
        file_size: Integer | nil
      }
    end
  end
end
