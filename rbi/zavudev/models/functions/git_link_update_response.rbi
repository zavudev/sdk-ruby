# typed: strong

module Zavudev
  module Models
    module Functions
      class GitLinkUpdateResponse < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::Functions::GitLinkUpdateResponse,
              Zavudev::Internal::AnyHash
            )
          end

        # A GitHub repository bound to a function. A push to `branch` deploys the
        # function. A function holds at most one link.
        sig { returns(Zavudev::Models::Functions::GitLinkUpdateResponse::Link) }
        attr_reader :link

        sig do
          params(
            link:
              Zavudev::Models::Functions::GitLinkUpdateResponse::Link::OrHash
          ).void
        end
        attr_writer :link

        # Endpoint that receives GitHub's push deliveries. Only needed on a `manual` link,
        # where you add it to the repository yourself.
        sig { returns(String) }
        attr_accessor :webhook_url

        # Shared secret for the repository's webhook. **Returned only when creating a
        # `manual` link, and only there** — every later read strips it, and re-linking
        # mints a new one. Absent entirely on an `app` link, which needs no secret of its
        # own.
        sig { returns(T.nilable(String)) }
        attr_reader :webhook_secret

        sig { params(webhook_secret: String).void }
        attr_writer :webhook_secret

        sig do
          params(
            link:
              Zavudev::Models::Functions::GitLinkUpdateResponse::Link::OrHash,
            webhook_url: String,
            webhook_secret: String
          ).returns(T.attached_class)
        end
        def self.new(
          # A GitHub repository bound to a function. A push to `branch` deploys the
          # function. A function holds at most one link.
          link:,
          # Endpoint that receives GitHub's push deliveries. Only needed on a `manual` link,
          # where you add it to the repository yourself.
          webhook_url:,
          # Shared secret for the repository's webhook. **Returned only when creating a
          # `manual` link, and only there** — every later read strips it, and re-linking
          # mints a new one. Absent entirely on an `app` link, which needs no secret of its
          # own.
          webhook_secret: nil
        )
        end

        sig do
          override.returns(
            {
              link: Zavudev::Models::Functions::GitLinkUpdateResponse::Link,
              webhook_url: String,
              webhook_secret: String
            }
          )
        end
        def to_hash
        end

        class Link < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::Functions::GitLinkUpdateResponse::Link,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          # When false the link is kept and pushes are ignored.
          sig { returns(T::Boolean) }
          attr_accessor :auto_deploy

          # Only pushes to this branch deploy.
          sig { returns(String) }
          attr_accessor :branch

          # How this link authenticates, decided by the server rather than by the caller.
          #
          # - `app`: the Zavu GitHub App is installed on the account. Pushes arrive on the
          #   app's webhook and private repositories work. Nothing to configure in the
          #   repository.
          # - `manual`: no installation. The link carries its own secret and you add the
          #   webhook to the repository yourself.
          sig do
            returns(
              Zavudev::Models::Functions::GitLinkUpdateResponse::Link::Connection::TaggedSymbol
            )
          end
          attr_accessor :connection

          sig { returns(Time) }
          attr_accessor :created_at

          sig { returns(String) }
          attr_accessor :function_id

          sig { returns(String) }
          attr_accessor :owner

          sig do
            returns(
              Zavudev::Models::Functions::GitLinkUpdateResponse::Link::Provider::TaggedSymbol
            )
          end
          attr_accessor :provider

          sig { returns(String) }
          attr_accessor :repo

          sig { returns(Time) }
          attr_accessor :updated_at

          sig { returns(T.nilable(String)) }
          attr_accessor :last_commit_message

          sig { returns(T.nilable(String)) }
          attr_accessor :last_commit_sha

          sig { returns(T.nilable(Time)) }
          attr_accessor :last_deploy_at

          # Why the last deploy failed. Null otherwise.
          sig { returns(T.nilable(String)) }
          attr_accessor :last_error

          sig do
            returns(
              T.nilable(
                Zavudev::Models::Functions::GitLinkUpdateResponse::Link::LastStatus::TaggedSymbol
              )
            )
          end
          attr_accessor :last_status

          # Subdirectory holding the project, for monorepos. Null when the project is at the
          # repository root.
          sig { returns(T.nilable(String)) }
          attr_accessor :root_dir

          # A GitHub repository bound to a function. A push to `branch` deploys the
          # function. A function holds at most one link.
          sig do
            params(
              id: String,
              auto_deploy: T::Boolean,
              branch: String,
              connection:
                Zavudev::Models::Functions::GitLinkUpdateResponse::Link::Connection::OrSymbol,
              created_at: Time,
              function_id: String,
              owner: String,
              provider:
                Zavudev::Models::Functions::GitLinkUpdateResponse::Link::Provider::OrSymbol,
              repo: String,
              updated_at: Time,
              last_commit_message: T.nilable(String),
              last_commit_sha: T.nilable(String),
              last_deploy_at: T.nilable(Time),
              last_error: T.nilable(String),
              last_status:
                T.nilable(
                  Zavudev::Models::Functions::GitLinkUpdateResponse::Link::LastStatus::OrSymbol
                ),
              root_dir: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            # When false the link is kept and pushes are ignored.
            auto_deploy:,
            # Only pushes to this branch deploy.
            branch:,
            # How this link authenticates, decided by the server rather than by the caller.
            #
            # - `app`: the Zavu GitHub App is installed on the account. Pushes arrive on the
            #   app's webhook and private repositories work. Nothing to configure in the
            #   repository.
            # - `manual`: no installation. The link carries its own secret and you add the
            #   webhook to the repository yourself.
            connection:,
            created_at:,
            function_id:,
            owner:,
            provider:,
            repo:,
            updated_at:,
            last_commit_message: nil,
            last_commit_sha: nil,
            last_deploy_at: nil,
            # Why the last deploy failed. Null otherwise.
            last_error: nil,
            last_status: nil,
            # Subdirectory holding the project, for monorepos. Null when the project is at the
            # repository root.
            root_dir: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                auto_deploy: T::Boolean,
                branch: String,
                connection:
                  Zavudev::Models::Functions::GitLinkUpdateResponse::Link::Connection::TaggedSymbol,
                created_at: Time,
                function_id: String,
                owner: String,
                provider:
                  Zavudev::Models::Functions::GitLinkUpdateResponse::Link::Provider::TaggedSymbol,
                repo: String,
                updated_at: Time,
                last_commit_message: T.nilable(String),
                last_commit_sha: T.nilable(String),
                last_deploy_at: T.nilable(Time),
                last_error: T.nilable(String),
                last_status:
                  T.nilable(
                    Zavudev::Models::Functions::GitLinkUpdateResponse::Link::LastStatus::TaggedSymbol
                  ),
                root_dir: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # How this link authenticates, decided by the server rather than by the caller.
          #
          # - `app`: the Zavu GitHub App is installed on the account. Pushes arrive on the
          #   app's webhook and private repositories work. Nothing to configure in the
          #   repository.
          # - `manual`: no installation. The link carries its own secret and you add the
          #   webhook to the repository yourself.
          module Connection
            extend Zavudev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Zavudev::Models::Functions::GitLinkUpdateResponse::Link::Connection
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            APP =
              T.let(
                :app,
                Zavudev::Models::Functions::GitLinkUpdateResponse::Link::Connection::TaggedSymbol
              )
            MANUAL =
              T.let(
                :manual,
                Zavudev::Models::Functions::GitLinkUpdateResponse::Link::Connection::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Zavudev::Models::Functions::GitLinkUpdateResponse::Link::Connection::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Provider
            extend Zavudev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Zavudev::Models::Functions::GitLinkUpdateResponse::Link::Provider
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GITHUB =
              T.let(
                :github,
                Zavudev::Models::Functions::GitLinkUpdateResponse::Link::Provider::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Zavudev::Models::Functions::GitLinkUpdateResponse::Link::Provider::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module LastStatus
            extend Zavudev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Zavudev::Models::Functions::GitLinkUpdateResponse::Link::LastStatus
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DEPLOYING =
              T.let(
                :deploying,
                Zavudev::Models::Functions::GitLinkUpdateResponse::Link::LastStatus::TaggedSymbol
              )
            DEPLOYED =
              T.let(
                :deployed,
                Zavudev::Models::Functions::GitLinkUpdateResponse::Link::LastStatus::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                Zavudev::Models::Functions::GitLinkUpdateResponse::Link::LastStatus::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Zavudev::Models::Functions::GitLinkUpdateResponse::Link::LastStatus::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
