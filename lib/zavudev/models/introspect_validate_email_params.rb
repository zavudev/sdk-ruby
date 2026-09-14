# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Introspect#validate_email
    class IntrospectValidateEmailParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute email
      #   Single email address to validate.
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute emails
      #   Batch of email addresses to validate (max 100).
      #
      #   @return [Array<String>, nil]
      optional :emails, Zavudev::Internal::Type::ArrayOf[String]

      # @!method initialize(email: nil, emails: nil, request_options: {})
      #   @param email [String] Single email address to validate.
      #
      #   @param emails [Array<String>] Batch of email addresses to validate (max 100).
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
