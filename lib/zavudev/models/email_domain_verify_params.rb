# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::EmailDomains#verify
    class EmailDomainVerifyParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute domain_id
      #
      #   @return [String]
      required :domain_id, String

      # @!method initialize(domain_id:, request_options: {})
      #   @param domain_id [String]
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
