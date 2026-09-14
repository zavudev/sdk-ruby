# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::EmailDomains#create
    class EmailDomainCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute domain
      #   Bare domain, e.g. example.com.
      #
      #   @return [String]
      required :domain, String

      # @!method initialize(domain:, request_options: {})
      #   @param domain [String] Bare domain, e.g. example.com.
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
