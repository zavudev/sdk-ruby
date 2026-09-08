# typed: strong

module Zavudev
  module Models
    class FunctionListDeploymentsResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::FunctionListDeploymentsResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig do
        returns(
          T::Array[Zavudev::Models::FunctionListDeploymentsResponse::Deployment]
        )
      end
      attr_accessor :deployments

      sig do
        params(
          deployments:
            T::Array[
              Zavudev::Models::FunctionListDeploymentsResponse::Deployment::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(deployments:)
      end

      sig do
        override.returns(
          {
            deployments:
              T::Array[
                Zavudev::Models::FunctionListDeploymentsResponse::Deployment
              ]
          }
        )
      end
      def to_hash
      end

      class Deployment < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::FunctionListDeploymentsResponse::Deployment,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig { returns(T.nilable(Integer)) }
        attr_accessor :bundle_size_bytes

        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :deployed_at

        sig { returns(T.nilable(String)) }
        attr_accessor :error_message

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_active

        sig { params(is_active: T::Boolean).void }
        attr_writer :is_active

        # Stage of a function deployment.
        sig do
          returns(
            T.nilable(
              Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status::TaggedSymbol
            )
          )
        end
        attr_reader :status

        sig do
          params(
            status:
              Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status::OrSymbol
          ).void
        end
        attr_writer :status

        sig { returns(T.nilable(Integer)) }
        attr_reader :version

        sig { params(version: Integer).void }
        attr_writer :version

        sig do
          params(
            id: String,
            bundle_size_bytes: T.nilable(Integer),
            created_at: Time,
            deployed_at: T.nilable(Time),
            error_message: T.nilable(String),
            is_active: T::Boolean,
            status:
              Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status::OrSymbol,
            version: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          bundle_size_bytes: nil,
          created_at: nil,
          deployed_at: nil,
          error_message: nil,
          is_active: nil,
          # Stage of a function deployment.
          status: nil,
          version: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              bundle_size_bytes: T.nilable(Integer),
              created_at: Time,
              deployed_at: T.nilable(Time),
              error_message: T.nilable(String),
              is_active: T::Boolean,
              status:
                Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status::TaggedSymbol,
              version: Integer
            }
          )
        end
        def to_hash
        end

        # Stage of a function deployment.
        module Status
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status::TaggedSymbol
            )
          BUNDLING =
            T.let(
              :bundling,
              Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status::TaggedSymbol
            )
          UPLOADING =
            T.let(
              :uploading,
              Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status::TaggedSymbol
            )
          PUBLISHING =
            T.let(
              :publishing,
              Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status::TaggedSymbol
            )
          ACTIVE =
            T.let(
              :active,
              Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status::TaggedSymbol
            )
          SUPERSEDED =
            T.let(
              :superseded,
              Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Models::FunctionListDeploymentsResponse::Deployment::Status::TaggedSymbol
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
