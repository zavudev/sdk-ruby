# frozen_string_literal: true

module Zavudev
  module Models
    module Functions
      # @see Zavudev::Resources::Functions::GitLink#link
      class GitLinkLinkParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        # @!attribute function_id
        #
        #   @return [String]
        required :function_id, String

        # @!attribute owner
        #
        #   @return [String]
        required :owner, String

        # @!attribute repo
        #
        #   @return [String]
        required :repo, String

        # @!attribute auto_deploy
        #
        #   @return [Boolean, nil]
        optional :auto_deploy, Zavudev::Internal::Type::Boolean, api_name: :autoDeploy

        # @!attribute branch
        #
        #   @return [String, nil]
        optional :branch, String

        # @!attribute root_dir
        #   Subdirectory holding the project, for monorepos.
        #
        #   @return [String, nil]
        optional :root_dir, String, api_name: :rootDir

        # @!method initialize(function_id:, owner:, repo:, auto_deploy: nil, branch: nil, root_dir: nil, request_options: {})
        #   @param function_id [String]
        #
        #   @param owner [String]
        #
        #   @param repo [String]
        #
        #   @param auto_deploy [Boolean]
        #
        #   @param branch [String]
        #
        #   @param root_dir [String] Subdirectory holding the project, for monorepos.
        #
        #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
