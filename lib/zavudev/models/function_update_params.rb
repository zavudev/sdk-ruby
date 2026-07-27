# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#update
    class FunctionUpdateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute function_id
      #
      #   @return [String]
      required :function_id, String

      # @!attribute dependencies
      #   New dependency map (replaces existing dependencies).
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :dependencies, Zavudev::Internal::Type::HashOf[String]

      # @!attribute http_enabled
      #   Expose the function on its public HTTPS URL, or take it down. Applies to the
      #   already-deployed function without redeploying; the URL is returned as
      #   `publicUrl`.
      #
      #   @return [Boolean, nil]
      optional :http_enabled, Zavudev::Internal::Type::Boolean, api_name: :httpEnabled

      # @!attribute source_code
      #   New source code for the draft (replaces it).
      #
      #   @return [String, nil]
      optional :source_code, String, api_name: :sourceCode

      # @!method initialize(function_id:, dependencies: nil, http_enabled: nil, source_code: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::FunctionUpdateParams} for more details.
      #
      #   @param function_id [String]
      #
      #   @param dependencies [Hash{Symbol=>String}] New dependency map (replaces existing dependencies).
      #
      #   @param http_enabled [Boolean] Expose the function on its public HTTPS URL, or take it down. Applies to the alr
      #
      #   @param source_code [String] New source code for the draft (replaces it).
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
