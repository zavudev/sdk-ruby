# frozen_string_literal: true

module Zavudev
  module Models
    class BroadcastContact < Zavudev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #
      #   @return [Time]
      required :created_at, Time, api_name: :createdAt

      # @!attribute recipient
      #
      #   @return [String]
      required :recipient, String

      # @!attribute recipient_type
      #
      #   @return [Symbol, Zavudev::Models::BroadcastContact::RecipientType]
      required :recipient_type,
               enum: -> {
                 Zavudev::BroadcastContact::RecipientType
               },
               api_name: :recipientType

      # @!attribute status
      #   Status of a contact within a broadcast.
      #
      #   @return [Symbol, Zavudev::Models::BroadcastContactStatus]
      required :status, enum: -> { Zavudev::BroadcastContactStatus }

      # @!attribute cost
      #
      #   @return [Float, nil]
      optional :cost, Float, nil?: true

      # @!attribute error_code
      #
      #   @return [String, nil]
      optional :error_code, String, api_name: :errorCode

      # @!attribute error_message
      #
      #   @return [String, nil]
      optional :error_message, String, api_name: :errorMessage

      # @!attribute message_id
      #   Associated message ID after processing.
      #
      #   @return [String, nil]
      optional :message_id, String, api_name: :messageId

      # @!attribute processed_at
      #
      #   @return [Time, nil]
      optional :processed_at, Time, api_name: :processedAt

      # @!attribute template_button_variables
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :template_button_variables,
               Zavudev::Internal::Type::HashOf[String],
               api_name: :templateButtonVariables

      # @!attribute template_variables
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :template_variables, Zavudev::Internal::Type::HashOf[String], api_name: :templateVariables

      # @!method initialize(id:, created_at:, recipient:, recipient_type:, status:, cost: nil, error_code: nil, error_message: nil, message_id: nil, processed_at: nil, template_button_variables: nil, template_variables: nil)
      #   @param id [String]
      #
      #   @param created_at [Time]
      #
      #   @param recipient [String]
      #
      #   @param recipient_type [Symbol, Zavudev::Models::BroadcastContact::RecipientType]
      #
      #   @param status [Symbol, Zavudev::Models::BroadcastContactStatus] Status of a contact within a broadcast.
      #
      #   @param cost [Float, nil]
      #
      #   @param error_code [String]
      #
      #   @param error_message [String]
      #
      #   @param message_id [String] Associated message ID after processing.
      #
      #   @param processed_at [Time]
      #
      #   @param template_button_variables [Hash{Symbol=>String}]
      #
      #   @param template_variables [Hash{Symbol=>String}]

      # @see Zavudev::Models::BroadcastContact#recipient_type
      module RecipientType
        extend Zavudev::Internal::Type::Enum

        PHONE = :phone
        EMAIL = :email

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
