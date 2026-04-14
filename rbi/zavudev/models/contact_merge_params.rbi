# typed: strong

module Zavudev
  module Models
    class ContactMergeParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::ContactMergeParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :contact_id

      # ID of the contact to merge into the target contact. The source contact will be
      # marked as merged.
      sig { returns(String) }
      attr_accessor :source_contact_id

      sig do
        params(
          contact_id: String,
          source_contact_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        contact_id:,
        # ID of the contact to merge into the target contact. The source contact will be
        # marked as merged.
        source_contact_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            contact_id: String,
            source_contact_id: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
