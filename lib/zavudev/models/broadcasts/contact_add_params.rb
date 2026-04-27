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

          # @!attribute template_button_variables
          #   Per-contact button variables for dynamic URL/OTP buttons. Keys are the button
          #   index (0, 1, 2).
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :template_button_variables,
                   Zavudev::Internal::Type::HashOf[String],
                   api_name: :templateButtonVariables

          # @!attribute template_variables
          #   Per-contact body variables. Keys are positions (1, 2, ...) matching the order
          #   placeholders appear in the template body.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :template_variables, Zavudev::Internal::Type::HashOf[String], api_name: :templateVariables

          # @!method initialize(recipient:, template_button_variables: nil, template_variables: nil)
          #   Some parameter documentations has been truncated, see
          #   {Zavudev::Models::Broadcasts::ContactAddParams::Contact} for more details.
          #
          #   @param recipient [String] Phone number (E.164) or email address.
          #
          #   @param template_button_variables [Hash{Symbol=>String}] Per-contact button variables for dynamic URL/OTP buttons. Keys are the button in
          #
          #   @param template_variables [Hash{Symbol=>String}] Per-contact body variables. Keys are positions (1, 2, ...) matching the order pl
        end
      end
    end
  end
end
