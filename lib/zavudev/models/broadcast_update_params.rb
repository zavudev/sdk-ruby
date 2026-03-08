# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Broadcasts#update
    class BroadcastUpdateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute broadcast_id
      #
      #   @return [String]
      required :broadcast_id, String

      # @!attribute content
      #   Content for non-text broadcast message types.
      #
      #   @return [Zavudev::Models::BroadcastContent, nil]
      optional :content, -> { Zavudev::BroadcastContent }

      # @!attribute email_html_body
      #
      #   @return [String, nil]
      optional :email_html_body, String, api_name: :emailHtmlBody

      # @!attribute email_subject
      #
      #   @return [String, nil]
      optional :email_subject, String, api_name: :emailSubject

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :metadata, Zavudev::Internal::Type::HashOf[String]

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute text
      #
      #   @return [String, nil]
      optional :text, String

      # @!method initialize(broadcast_id:, content: nil, email_html_body: nil, email_subject: nil, metadata: nil, name: nil, text: nil, request_options: {})
      #   @param broadcast_id [String]
      #
      #   @param content [Zavudev::Models::BroadcastContent] Content for non-text broadcast message types.
      #
      #   @param email_html_body [String]
      #
      #   @param email_subject [String]
      #
      #   @param metadata [Hash{Symbol=>String}]
      #
      #   @param name [String]
      #
      #   @param text [String]
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
