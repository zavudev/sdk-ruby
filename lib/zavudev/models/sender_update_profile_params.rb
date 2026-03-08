# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Senders#update_profile
    class SenderUpdateProfileParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute sender_id
      #
      #   @return [String]
      required :sender_id, String

      # @!attribute about
      #   Short description of the business (max 139 characters).
      #
      #   @return [String, nil]
      optional :about, String

      # @!attribute address
      #   Physical address of the business (max 256 characters).
      #
      #   @return [String, nil]
      optional :address, String

      # @!attribute description
      #   Extended description of the business (max 512 characters).
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute email
      #   Business email address.
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute vertical
      #   Business category for WhatsApp Business profile.
      #
      #   @return [Symbol, Zavudev::Models::WhatsappBusinessProfileVertical, nil]
      optional :vertical, enum: -> { Zavudev::WhatsappBusinessProfileVertical }

      # @!attribute websites
      #   Business website URLs (maximum 2).
      #
      #   @return [Array<String>, nil]
      optional :websites, Zavudev::Internal::Type::ArrayOf[String]

      # @!method initialize(sender_id:, about: nil, address: nil, description: nil, email: nil, vertical: nil, websites: nil, request_options: {})
      #   @param sender_id [String]
      #
      #   @param about [String] Short description of the business (max 139 characters).
      #
      #   @param address [String] Physical address of the business (max 256 characters).
      #
      #   @param description [String] Extended description of the business (max 512 characters).
      #
      #   @param email [String] Business email address.
      #
      #   @param vertical [Symbol, Zavudev::Models::WhatsappBusinessProfileVertical] Business category for WhatsApp Business profile.
      #
      #   @param websites [Array<String>] Business website URLs (maximum 2).
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
