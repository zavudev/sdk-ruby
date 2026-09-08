# frozen_string_literal: true

module Zavudev
  module Models
    module Functions
      # @see Zavudev::Resources::Functions::GitLink#update
      class GitLinkUpdateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute function_id
        #
        #   @return [String]
        required :function_id, String

        # @!attribute auto_deploy
        #
        #   @return [Boolean, nil]
        optional :auto_deploy, Zavudev::Internal::Type::Boolean, api_name: :autoDeploy

        # @!attribute branch
        #
        #   @return [String, nil]
        optional :branch, String

        # @!attribute root_dir
        #
        #   @return [String, nil]
        optional :root_dir, String, api_name: :rootDir, nil?: true

        # @!method initialize(function_id:, auto_deploy: nil, branch: nil, root_dir: nil, request_options: {})
        #   @param function_id [String]
        #   @param auto_deploy [Boolean]
        #   @param branch [String]
        #   @param root_dir [String, nil]
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
