# frozen_string_literal: true

module Zavudev
  module Resources
    class Functions
      class GitLink
        # The link and its last deploy. Never returns the webhook secret.
        #
        # @overload retrieve(function_id, request_options: {})
        #
        # @param function_id [String] Zavu Function ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Functions::GitLinkRetrieveResponse]
        #
        # @see Zavudev::Models::Functions::GitLinkRetrieveParams
        def retrieve(function_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/functions/%1$s/git-link", function_id],
            model: Zavudev::Models::Functions::GitLinkRetrieveResponse,
            options: params[:request_options]
          )
        end

        # Change the branch, the root directory, or whether pushes deploy. Pass at least
        # one field. `rootDir: null` clears the subdirectory.
        #
        # @overload update(function_id, auto_deploy: nil, branch: nil, root_dir: nil, request_options: {})
        #
        # @param function_id [String] Zavu Function ID.
        #
        # @param auto_deploy [Boolean]
        #
        # @param branch [String]
        #
        # @param root_dir [String, nil]
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Functions::GitLinkUpdateResponse]
        #
        # @see Zavudev::Models::Functions::GitLinkUpdateParams
        def update(function_id, params = {})
          parsed, options = Zavudev::Functions::GitLinkUpdateParams.dump_request(params)
          @client.request(
            method: :patch,
            path: ["v1/functions/%1$s/git-link", function_id],
            body: parsed,
            model: Zavudev::Models::Functions::GitLinkUpdateResponse,
            options: options
          )
        end

        # Fetch the linked branch and deploy it without waiting for a push. Returns
        # immediately; follow the outcome with `GET /v1/functions/{functionId}/git-link`,
        # whose `lastStatus` and `lastError` describe the run.
        #
        # @overload deploy_now(function_id, request_options: {})
        #
        # @param function_id [String] Zavu Function ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Functions::GitLinkDeployNowResponse]
        #
        # @see Zavudev::Models::Functions::GitLinkDeployNowParams
        def deploy_now(function_id, params = {})
          @client.request(
            method: :post,
            path: ["v1/functions/%1$s/git-link/deploy", function_id],
            model: Zavudev::Models::Functions::GitLinkDeployNowResponse,
            options: params[:request_options]
          )
        end

        # Bind a repository to this function so every push to `branch` deploys it. A
        # function holds at most one link; linking again returns 400.
        #
        # **The server decides how the link authenticates.** If the project has the Zavu
        # GitHub App installed, the link uses that installation: private repositories work
        # and there is nothing to configure in the repository. Otherwise it falls back to
        # a manual link and the response carries a `webhookSecret` you add to the
        # repository yourself. `connection` says which one you got.
        #
        # The repository is not checked against GitHub here, because it cannot be: an
        # owner/repo that does not exist, or that the installation cannot see, is accepted
        # and fails on the first deploy with a fetch error.
        #
        # @overload link(function_id, owner:, repo:, auto_deploy: nil, branch: nil, root_dir: nil, request_options: {})
        #
        # @param function_id [String] Zavu Function ID.
        #
        # @param owner [String]
        #
        # @param repo [String]
        #
        # @param auto_deploy [Boolean]
        #
        # @param branch [String]
        #
        # @param root_dir [String] Subdirectory holding the project, for monorepos.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Zavudev::Models::Functions::GitLinkLinkResponse]
        #
        # @see Zavudev::Models::Functions::GitLinkLinkParams
        def link(function_id, params)
          parsed, options = Zavudev::Functions::GitLinkLinkParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/functions/%1$s/git-link", function_id],
            body: parsed,
            model: Zavudev::Models::Functions::GitLinkLinkResponse,
            options: options
          )
        end

        # Remove the link. The function and its deployments stay. A manual webhook left in
        # the repository stops being accepted, so remove it there too.
        #
        # @overload unlink(function_id, request_options: {})
        #
        # @param function_id [String] Zavu Function ID.
        #
        # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Zavudev::Models::Functions::GitLinkUnlinkParams
        def unlink(function_id, params = {})
          @client.request(
            method: :delete,
            path: ["v1/functions/%1$s/git-link", function_id],
            model: NilClass,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Zavudev::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
