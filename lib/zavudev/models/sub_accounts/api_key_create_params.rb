# frozen_string_literal: true

module Zavudev
  module Models
    module SubAccounts
      # @see Zavudev::Resources::SubAccounts::APIKeys#create
      class APIKeyCreateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute environment
        #
        #   @return [Symbol, Zavudev::Models::SubAccounts::APIKeyCreateParams::Environment, nil]
        optional :environment, enum: -> { Zavudev::SubAccounts::APIKeyCreateParams::Environment }

        # @!attribute permissions
        #
        #   @return [Array<String>, nil]
        optional :permissions, Zavudev::Internal::Type::ArrayOf[String]

        # @!method initialize(id:, name:, environment: nil, permissions: nil, request_options: {})
        #   @param id [String]
        #   @param name [String]
        #   @param environment [Symbol, Zavudev::Models::SubAccounts::APIKeyCreateParams::Environment]
        #   @param permissions [Array<String>]
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

        module Environment
          extend Zavudev::Internal::Type::Enum

          LIVE = :live
          TEST = :test

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
