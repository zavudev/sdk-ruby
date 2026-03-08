# frozen_string_literal: true

module Zavudev
  module Models
    class WhatsappBusinessProfile < Zavudev::Internal::Type::BaseModel
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

      # @!attribute profile_picture_url
      #   URL of the business profile picture.
      #
      #   @return [String, nil]
      optional :profile_picture_url, String, api_name: :profilePictureUrl

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

      # @!method initialize(about: nil, address: nil, description: nil, email: nil, profile_picture_url: nil, vertical: nil, websites: nil)
      #   WhatsApp Business profile information.
      #
      #   @param about [String] Short description of the business (max 139 characters).
      #
      #   @param address [String] Physical address of the business (max 256 characters).
      #
      #   @param description [String] Extended description of the business (max 512 characters).
      #
      #   @param email [String] Business email address.
      #
      #   @param profile_picture_url [String] URL of the business profile picture.
      #
      #   @param vertical [Symbol, Zavudev::Models::WhatsappBusinessProfileVertical] Business category for WhatsApp Business profile.
      #
      #   @param websites [Array<String>] Business website URLs (maximum 2).
    end
  end
end
