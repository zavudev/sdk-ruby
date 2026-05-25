# typed: strong

module Zavudev
  module Models
    class FunctionCreateResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::FunctionCreateResponse,
            Zavudev::Internal::AnyHash
          )
        end

      # A Zavu Function — user-supplied TypeScript that runs in Zavu Cloud and reacts to
      # messaging events or HTTP requests.
      sig { returns(Zavudev::Models::FunctionCreateResponse::Function) }
      attr_reader :function

      sig do
        params(
          function: Zavudev::Models::FunctionCreateResponse::Function::OrHash
        ).void
      end
      attr_writer :function

      sig do
        params(
          function: Zavudev::Models::FunctionCreateResponse::Function::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A Zavu Function — user-supplied TypeScript that runs in Zavu Cloud and reacts to
        # messaging events or HTTP requests.
        function:
      )
      end

      sig do
        override.returns(
          { function: Zavudev::Models::FunctionCreateResponse::Function }
        )
      end
      def to_hash
      end

      class Function < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::FunctionCreateResponse::Function,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        # npm dependencies installed in the function bundle. Keys are package names,
        # values are semver ranges.
        sig { returns(T::Hash[Symbol, String]) }
        attr_accessor :dependencies

        # Whether the function can be invoked over HTTPS via its public URL.
        sig { returns(T::Boolean) }
        attr_accessor :http_enabled

        # Memory allocation in MB.
        sig { returns(Integer) }
        attr_accessor :memory_mb

        sig { returns(String) }
        attr_accessor :name

        # Runtime the function is deployed on.
        sig do
          returns(
            Zavudev::Models::FunctionCreateResponse::Function::Runtime::TaggedSymbol
          )
        end
        attr_accessor :runtime

        # URL-safe identifier, unique per project.
        sig { returns(String) }
        attr_accessor :slug

        # Lifecycle status of a Zavu Function.
        sig do
          returns(
            Zavudev::Models::FunctionCreateResponse::Function::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Per-invocation timeout in seconds.
        sig { returns(Integer) }
        attr_accessor :timeout_sec

        sig { returns(Time) }
        attr_accessor :updated_at

        # ID of the deployment currently serving traffic.
        sig { returns(T.nilable(String)) }
        attr_accessor :active_deployment_id

        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # HTTPS endpoint when httpEnabled is true.
        sig { returns(T.nilable(String)) }
        attr_accessor :public_url

        # A Zavu Function — user-supplied TypeScript that runs in Zavu Cloud and reacts to
        # messaging events or HTTP requests.
        sig do
          params(
            id: String,
            created_at: Time,
            dependencies: T::Hash[Symbol, String],
            http_enabled: T::Boolean,
            memory_mb: Integer,
            name: String,
            runtime:
              Zavudev::Models::FunctionCreateResponse::Function::Runtime::OrSymbol,
            slug: String,
            status:
              Zavudev::Models::FunctionCreateResponse::Function::Status::OrSymbol,
            timeout_sec: Integer,
            updated_at: Time,
            active_deployment_id: T.nilable(String),
            description: T.nilable(String),
            public_url: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          # npm dependencies installed in the function bundle. Keys are package names,
          # values are semver ranges.
          dependencies:,
          # Whether the function can be invoked over HTTPS via its public URL.
          http_enabled:,
          # Memory allocation in MB.
          memory_mb:,
          name:,
          # Runtime the function is deployed on.
          runtime:,
          # URL-safe identifier, unique per project.
          slug:,
          # Lifecycle status of a Zavu Function.
          status:,
          # Per-invocation timeout in seconds.
          timeout_sec:,
          updated_at:,
          # ID of the deployment currently serving traffic.
          active_deployment_id: nil,
          description: nil,
          # HTTPS endpoint when httpEnabled is true.
          public_url: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              dependencies: T::Hash[Symbol, String],
              http_enabled: T::Boolean,
              memory_mb: Integer,
              name: String,
              runtime:
                Zavudev::Models::FunctionCreateResponse::Function::Runtime::TaggedSymbol,
              slug: String,
              status:
                Zavudev::Models::FunctionCreateResponse::Function::Status::TaggedSymbol,
              timeout_sec: Integer,
              updated_at: Time,
              active_deployment_id: T.nilable(String),
              description: T.nilable(String),
              public_url: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # Runtime the function is deployed on.
        module Runtime
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Zavudev::Models::FunctionCreateResponse::Function::Runtime
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NODEJS24 =
            T.let(
              :nodejs24,
              Zavudev::Models::FunctionCreateResponse::Function::Runtime::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Models::FunctionCreateResponse::Function::Runtime::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Lifecycle status of a Zavu Function.
        module Status
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Zavudev::Models::FunctionCreateResponse::Function::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DRAFT =
            T.let(
              :draft,
              Zavudev::Models::FunctionCreateResponse::Function::Status::TaggedSymbol
            )
          BUNDLING =
            T.let(
              :bundling,
              Zavudev::Models::FunctionCreateResponse::Function::Status::TaggedSymbol
            )
          DEPLOYING =
            T.let(
              :deploying,
              Zavudev::Models::FunctionCreateResponse::Function::Status::TaggedSymbol
            )
          ACTIVE =
            T.let(
              :active,
              Zavudev::Models::FunctionCreateResponse::Function::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              Zavudev::Models::FunctionCreateResponse::Function::Status::TaggedSymbol
            )
          DISABLED =
            T.let(
              :disabled,
              Zavudev::Models::FunctionCreateResponse::Function::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Models::FunctionCreateResponse::Function::Status::TaggedSymbol
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
