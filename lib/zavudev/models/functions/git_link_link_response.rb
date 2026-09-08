# frozen_string_literal: true

module Zavudev
  module Models
    module Functions
      # @see Zavudev::Resources::Functions::GitLink#link
      class GitLinkLinkResponse < Zavudev::Internal::Type::BaseModel
        # @!attribute link
        #   A GitHub repository bound to a function. A push to `branch` deploys the
        #   function. A function holds at most one link.
        #
        #   @return [Zavudev::Models::Functions::GitLinkLinkResponse::Link]
        required :link, -> { Zavudev::Models::Functions::GitLinkLinkResponse::Link }

        # @!attribute webhook_url
        #   Endpoint that receives GitHub's push deliveries. Only needed on a `manual` link,
        #   where you add it to the repository yourself.
        #
        #   @return [String]
        required :webhook_url, String, api_name: :webhookUrl

        # @!attribute webhook_secret
        #   Shared secret for the repository's webhook. **Returned only when creating a
        #   `manual` link, and only there** — every later read strips it, and re-linking
        #   mints a new one. Absent entirely on an `app` link, which needs no secret of its
        #   own.
        #
        #   @return [String, nil]
        optional :webhook_secret, String, api_name: :webhookSecret

        # @!method initialize(link:, webhook_url:, webhook_secret: nil)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::Functions::GitLinkLinkResponse} for more details.
        #
        #   @param link [Zavudev::Models::Functions::GitLinkLinkResponse::Link] A GitHub repository bound to a function. A push to `branch` deploys the function
        #
        #   @param webhook_url [String] Endpoint that receives GitHub's push deliveries. Only needed on a `manual` link,
        #
        #   @param webhook_secret [String] Shared secret for the repository's webhook. \*\*Returned only when creating a
        #   `man

        # @see Zavudev::Models::Functions::GitLinkLinkResponse#link
        class Link < Zavudev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute auto_deploy
          #   When false the link is kept and pushes are ignored.
          #
          #   @return [Boolean]
          required :auto_deploy, Zavudev::Internal::Type::Boolean, api_name: :autoDeploy

          # @!attribute branch
          #   Only pushes to this branch deploy.
          #
          #   @return [String]
          required :branch, String

          # @!attribute connection
          #   How this link authenticates, decided by the server rather than by the caller.
          #
          #   - `app`: the Zavu GitHub App is installed on the account. Pushes arrive on the
          #     app's webhook and private repositories work. Nothing to configure in the
          #     repository.
          #   - `manual`: no installation. The link carries its own secret and you add the
          #     webhook to the repository yourself.
          #
          #   @return [Symbol, Zavudev::Models::Functions::GitLinkLinkResponse::Link::Connection]
          required :connection, enum: -> { Zavudev::Models::Functions::GitLinkLinkResponse::Link::Connection }

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time, api_name: :createdAt

          # @!attribute function_id
          #
          #   @return [String]
          required :function_id, String, api_name: :functionId

          # @!attribute owner
          #
          #   @return [String]
          required :owner, String

          # @!attribute provider
          #
          #   @return [Symbol, Zavudev::Models::Functions::GitLinkLinkResponse::Link::Provider]
          required :provider, enum: -> { Zavudev::Models::Functions::GitLinkLinkResponse::Link::Provider }

          # @!attribute repo
          #
          #   @return [String]
          required :repo, String

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time, api_name: :updatedAt

          # @!attribute last_commit_message
          #
          #   @return [String, nil]
          optional :last_commit_message, String, api_name: :lastCommitMessage, nil?: true

          # @!attribute last_commit_sha
          #
          #   @return [String, nil]
          optional :last_commit_sha, String, api_name: :lastCommitSha, nil?: true

          # @!attribute last_deploy_at
          #
          #   @return [Time, nil]
          optional :last_deploy_at, Time, api_name: :lastDeployAt, nil?: true

          # @!attribute last_error
          #   Why the last deploy failed. Null otherwise.
          #
          #   @return [String, nil]
          optional :last_error, String, api_name: :lastError, nil?: true

          # @!attribute last_status
          #
          #   @return [Symbol, Zavudev::Models::Functions::GitLinkLinkResponse::Link::LastStatus, nil]
          optional :last_status,
                   enum: -> { Zavudev::Models::Functions::GitLinkLinkResponse::Link::LastStatus },
                   api_name: :lastStatus,
                   nil?: true

          # @!attribute root_dir
          #   Subdirectory holding the project, for monorepos. Null when the project is at the
          #   repository root.
          #
          #   @return [String, nil]
          optional :root_dir, String, api_name: :rootDir, nil?: true

          # @!method initialize(id:, auto_deploy:, branch:, connection:, created_at:, function_id:, owner:, provider:, repo:, updated_at:, last_commit_message: nil, last_commit_sha: nil, last_deploy_at: nil, last_error: nil, last_status: nil, root_dir: nil)
          #   Some parameter documentations has been truncated, see
          #   {Zavudev::Models::Functions::GitLinkLinkResponse::Link} for more details.
          #
          #   A GitHub repository bound to a function. A push to `branch` deploys the
          #   function. A function holds at most one link.
          #
          #   @param id [String]
          #
          #   @param auto_deploy [Boolean] When false the link is kept and pushes are ignored.
          #
          #   @param branch [String] Only pushes to this branch deploy.
          #
          #   @param connection [Symbol, Zavudev::Models::Functions::GitLinkLinkResponse::Link::Connection] How this link authenticates, decided by the server rather than by the caller.
          #
          #   @param created_at [Time]
          #
          #   @param function_id [String]
          #
          #   @param owner [String]
          #
          #   @param provider [Symbol, Zavudev::Models::Functions::GitLinkLinkResponse::Link::Provider]
          #
          #   @param repo [String]
          #
          #   @param updated_at [Time]
          #
          #   @param last_commit_message [String, nil]
          #
          #   @param last_commit_sha [String, nil]
          #
          #   @param last_deploy_at [Time, nil]
          #
          #   @param last_error [String, nil] Why the last deploy failed. Null otherwise.
          #
          #   @param last_status [Symbol, Zavudev::Models::Functions::GitLinkLinkResponse::Link::LastStatus, nil]
          #
          #   @param root_dir [String, nil] Subdirectory holding the project, for monorepos. Null when the project is at the

          # How this link authenticates, decided by the server rather than by the caller.
          #
          # - `app`: the Zavu GitHub App is installed on the account. Pushes arrive on the
          #   app's webhook and private repositories work. Nothing to configure in the
          #   repository.
          # - `manual`: no installation. The link carries its own secret and you add the
          #   webhook to the repository yourself.
          #
          # @see Zavudev::Models::Functions::GitLinkLinkResponse::Link#connection
          module Connection
            extend Zavudev::Internal::Type::Enum

            APP = :app
            MANUAL = :manual

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Zavudev::Models::Functions::GitLinkLinkResponse::Link#provider
          module Provider
            extend Zavudev::Internal::Type::Enum

            GITHUB = :github

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Zavudev::Models::Functions::GitLinkLinkResponse::Link#last_status
          module LastStatus
            extend Zavudev::Internal::Type::Enum

            DEPLOYING = :deploying
            DEPLOYED = :deployed
            FAILED = :failed

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
