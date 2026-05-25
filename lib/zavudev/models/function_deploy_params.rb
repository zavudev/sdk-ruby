# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#deploy
    class FunctionDeployParams < Zavudev::Internal::Type::BaseModel
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

      # @!attribute source_code
      #   New source code to publish (replaces the draft).
      #
      #   @return [String, nil]
      optional :source_code, String, api_name: :sourceCode

      # @!method initialize(function_id:, dependencies: nil, source_code: nil, request_options: {})
      #   @param function_id [String]
      #
      #   @param dependencies [Hash{Symbol=>String}] New dependency map (replaces existing dependencies).
      #
      #   @param source_code [String] New source code to publish (replaces the draft).
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
