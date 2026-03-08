# frozen_string_literal: true

module Zavudev
  module Models
    module Broadcasts
      # @see Zavudev::Resources::Broadcasts::Contacts#add
      class ContactAddParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute broadcast_id
        #
        #   @return [String]
        required :broadcast_id, String

        # @!attribute contacts
        #   List of contacts to add (max 1000 per request).
        #
        #   @return [Array<Zavudev::Models::Broadcasts::ContactAddParams::Contact>]
        required :contacts,
                 -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Broadcasts::ContactAddParams::Contact] }

        # @!method initialize(broadcast_id:, contacts:, request_options: {})
        #   @param broadcast_id [String]
        #
        #   @param contacts [Array<Zavudev::Models::Broadcasts::ContactAddParams::Contact>] List of contacts to add (max 1000 per request).
        #
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

        class Contact < Zavudev::Internal::Type::BaseModel
          # @!attribute recipient
          #   Phone number (E.164) or email address.
          #
          #   @return [String]
          required :recipient, String

          # @!attribute template_variables
          #   Per-contact template variables to personalize the message.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :template_variables, Zavudev::Internal::Type::HashOf[String], api_name: :templateVariables

          # @!method initialize(recipient:, template_variables: nil)
          #   @param recipient [String] Phone number (E.164) or email address.
          #
          #   @param template_variables [Hash{Symbol=>String}] Per-contact template variables to personalize the message.
        end
      end
    end
  end
end
