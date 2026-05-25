# typed: strong

module Zavudev
  module Models
    class FunctionDeployResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::FunctionDeployResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig { returns(Zavudev::Models::FunctionDeployResponse::Deployment) }
      attr_reader :deployment

      sig do
        params(
          deployment:
            Zavudev::Models::FunctionDeployResponse::Deployment::OrHash
        ).void
      end
      attr_writer :deployment

      sig do
        params(
          deployment:
            Zavudev::Models::FunctionDeployResponse::Deployment::OrHash
        ).returns(T.attached_class)
      end
      def self.new(deployment:)
      end

      sig do
        override.returns(
          { deployment: Zavudev::Models::FunctionDeployResponse::Deployment }
        )
      end
      def to_hash
      end

      class Deployment < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::FunctionDeployResponse::Deployment,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :function_id

        # Stage of a function deployment.
        sig do
          returns(
            Zavudev::Models::FunctionDeployResponse::Deployment::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Monotonically increasing deployment version, starting at 1.
        sig { returns(Integer) }
        attr_accessor :version

        sig { returns(T.nilable(Integer)) }
        attr_accessor :bundle_bytes

        sig { returns(T.nilable(Time)) }
        attr_accessor :deployed_at

        # Failure reason when status is 'failed'.
        sig { returns(T.nilable(String)) }
        attr_accessor :error_message

        sig { returns(T.nilable(Integer)) }
        attr_accessor :source_code_bytes

        sig do
          params(
            id: String,
            created_at: Time,
            function_id: String,
            status:
              Zavudev::Models::FunctionDeployResponse::Deployment::Status::OrSymbol,
            version: Integer,
            bundle_bytes: T.nilable(Integer),
            deployed_at: T.nilable(Time),
            error_message: T.nilable(String),
            source_code_bytes: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          function_id:,
          # Stage of a function deployment.
          status:,
          # Monotonically increasing deployment version, starting at 1.
          version:,
          bundle_bytes: nil,
          deployed_at: nil,
          # Failure reason when status is 'failed'.
          error_message: nil,
          source_code_bytes: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              function_id: String,
              status:
                Zavudev::Models::FunctionDeployResponse::Deployment::Status::TaggedSymbol,
              version: Integer,
              bundle_bytes: T.nilable(Integer),
              deployed_at: T.nilable(Time),
              error_message: T.nilable(String),
              source_code_bytes: T.nilable(Integer)
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
                Zavudev::Models::FunctionDeployResponse::Deployment::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              Zavudev::Models::FunctionDeployResponse::Deployment::Status::TaggedSymbol
            )
          BUNDLING =
            T.let(
              :bundling,
              Zavudev::Models::FunctionDeployResponse::Deployment::Status::TaggedSymbol
            )
          UPLOADING =
            T.let(
              :uploading,
              Zavudev::Models::FunctionDeployResponse::Deployment::Status::TaggedSymbol
            )
          PUBLISHING =
            T.let(
              :publishing,
              Zavudev::Models::FunctionDeployResponse::Deployment::Status::TaggedSymbol
            )
          ACTIVE =
            T.let(
              :active,
              Zavudev::Models::FunctionDeployResponse::Deployment::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Zavudev::Models::FunctionDeployResponse::Deployment::Status::TaggedSymbol
            )
          SUPERSEDED =
            T.let(
              :superseded,
              Zavudev::Models::FunctionDeployResponse::Deployment::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Models::FunctionDeployResponse::Deployment::Status::TaggedSymbol
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
