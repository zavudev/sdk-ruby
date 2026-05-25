# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Me#retrieve
    class MeRetrieveResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute api_key
      #
      #   @return [Zavudev::Models::MeRetrieveResponse::APIKey]
      required :api_key, -> { Zavudev::Models::MeRetrieveResponse::APIKey }, api_name: :apiKey

      # @!attribute is_test_mode
      #
      #   @return [Boolean]
      required :is_test_mode, Zavudev::Internal::Type::Boolean, api_name: :isTestMode

      # @!attribute project
      #
      #   @return [Zavudev::Models::MeRetrieveResponse::Project]
      required :project, -> { Zavudev::Models::MeRetrieveResponse::Project }

      # @!attribute team
      #
      #   @return [Zavudev::Models::MeRetrieveResponse::Team]
      required :team, -> { Zavudev::Models::MeRetrieveResponse::Team }

      # @!method initialize(api_key:, is_test_mode:, project:, team:)
      #   @param api_key [Zavudev::Models::MeRetrieveResponse::APIKey]
      #   @param is_test_mode [Boolean]
      #   @param project [Zavudev::Models::MeRetrieveResponse::Project]
      #   @param team [Zavudev::Models::MeRetrieveResponse::Team]

      # @see Zavudev::Models::MeRetrieveResponse#api_key
      class APIKey < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:)
        #   @param id [String]
      end

      # @see Zavudev::Models::MeRetrieveResponse#project
      class Project < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute is_sub_account
        #
        #   @return [Boolean]
        required :is_sub_account, Zavudev::Internal::Type::Boolean, api_name: :isSubAccount

        # @!attribute name
        #
        #   @return [String, nil]
        required :name, String, nil?: true

        # @!method initialize(id:, is_sub_account:, name:)
        #   @param id [String]
        #   @param is_sub_account [Boolean]
        #   @param name [String, nil]
      end

      # @see Zavudev::Models::MeRetrieveResponse#team
      class Team < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute name
        #
        #   @return [String, nil]
        required :name, String, nil?: true

        # @!method initialize(id:, name:)
        #   @param id [String]
        #   @param name [String, nil]
      end
    end
  end
end
