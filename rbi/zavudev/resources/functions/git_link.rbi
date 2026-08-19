# typed: strong

module Zavudev
  module Resources
    class Functions
      class GitLink
        # The link and its last deploy. Never returns the webhook secret.
        sig do
          params(
            function_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Functions::GitLinkRetrieveResponse)
        end
        def retrieve(
          # Zavu Function ID.
          function_id,
          request_options: {}
        )
        end

        # Change the branch, the root directory, or whether pushes deploy. Pass at least
        # one field. `rootDir: null` clears the subdirectory.
        sig do
          params(
            function_id: String,
            auto_deploy: T::Boolean,
            branch: String,
            root_dir: T.nilable(String),
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Functions::GitLinkUpdateResponse)
        end
        def update(
          # Zavu Function ID.
          function_id,
          auto_deploy: nil,
          branch: nil,
          root_dir: nil,
          request_options: {}
        )
        end

        # Fetch the linked branch and deploy it without waiting for a push. Returns
        # immediately; follow the outcome with `GET /v1/functions/{functionId}/git-link`,
        # whose `lastStatus` and `lastError` describe the run.
        sig do
          params(
            function_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Functions::GitLinkDeployNowResponse)
        end
        def deploy_now(
          # Zavu Function ID.
          function_id,
          request_options: {}
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
        sig do
          params(
            function_id: String,
            owner: String,
            repo: String,
            auto_deploy: T::Boolean,
            branch: String,
            root_dir: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(Zavudev::Models::Functions::GitLinkLinkResponse)
        end
        def link(
          # Zavu Function ID.
          function_id,
          owner:,
          repo:,
          auto_deploy: nil,
          branch: nil,
          # Subdirectory holding the project, for monorepos.
          root_dir: nil,
          request_options: {}
        )
        end

        # Remove the link. The function and its deployments stay. A manual webhook left in
        # the repository stops being accepted, so remove it there too.
        sig do
          params(
            function_id: String,
            request_options: Zavudev::RequestOptions::OrHash
          ).void
        end
        def unlink(
          # Zavu Function ID.
          function_id,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Zavudev::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
