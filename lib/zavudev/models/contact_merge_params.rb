# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Contacts#merge
    class ContactMergeParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute contact_id
      #
      #   @return [String]
      required :contact_id, String

      # @!attribute source_contact_id
      #   ID of the contact to merge into the target contact. The source contact will be
      #   marked as merged.
      #
      #   @return [String]
      required :source_contact_id, String, api_name: :sourceContactId

      # @!method initialize(contact_id:, source_contact_id:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::ContactMergeParams} for more details.
      #
      #   @param contact_id [String]
      #
      #   @param source_contact_id [String] ID of the contact to merge into the target contact. The source contact will be m
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
