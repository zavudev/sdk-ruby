# frozen_string_literal: true

require_relative "../test_helper"

class Zavudev::Test::Resources::RegulatoryDocumentsTest < Zavudev::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response =
      @zavudev.regulatory_documents.create(
        document_type: :passport,
        file_size: 102_400,
        mime_type: "image/jpeg",
        name: "Passport Scan",
        storage_id: "kg2abc123..."
      )

    assert_pattern do
      response => Zavudev::Models::RegulatoryDocumentCreateResponse
    end

    assert_pattern do
      response => {
        document: Zavudev::RegulatoryDocument
      }
    end
  end

  def test_retrieve
    skip("Mock server tests are disabled")

    response = @zavudev.regulatory_documents.retrieve("documentId")

    assert_pattern do
      response => Zavudev::Models::RegulatoryDocumentRetrieveResponse
    end

    assert_pattern do
      response => {
        document: Zavudev::RegulatoryDocument
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @zavudev.regulatory_documents.list

    assert_pattern do
      response => Zavudev::Internal::Cursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Zavudev::RegulatoryDocument
    end

    assert_pattern do
      row => {
        id: String,
        created_at: Time,
        document_type: Zavudev::RegulatoryDocument::DocumentType,
        name: String,
        status: Zavudev::RegulatoryDocument::Status,
        file_size: Integer | nil,
        mime_type: String | nil,
        rejection_reason: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_delete
    skip("Mock server tests are disabled")

    response = @zavudev.regulatory_documents.delete("documentId")

    assert_pattern do
      response => nil
    end
  end

  def test_upload_url
    skip("Mock server tests are disabled")

    response = @zavudev.regulatory_documents.upload_url

    assert_pattern do
      response => Zavudev::Models::RegulatoryDocumentUploadURLResponse
    end

    assert_pattern do
      response => {
        upload_url: String
      }
    end
  end
end
