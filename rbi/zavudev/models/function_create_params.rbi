# typed: strong

module Zavudev
  module Models
    class FunctionCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::FunctionCreateParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      # URL-safe identifier (lowercase, digits, hyphens). Must be unique per project.
      sig { returns(String) }
      attr_accessor :slug

      # npm dependencies. Keys are package names, values are semver ranges.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :dependencies

      sig { params(dependencies: T::Hash[Symbol, String]).void }
      attr_writer :dependencies

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Whether to expose a public HTTPS URL for this function.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :http_enabled

      sig { params(http_enabled: T::Boolean).void }
      attr_writer :http_enabled

      sig do
        returns(T.nilable(Zavudev::FunctionCreateParams::MemoryMB::OrInteger))
      end
      attr_reader :memory_mb

      sig do
        params(
          memory_mb: Zavudev::FunctionCreateParams::MemoryMB::OrInteger
        ).void
      end
      attr_writer :memory_mb

      # Runtime the function is deployed on.
      sig do
        returns(T.nilable(Zavudev::FunctionCreateParams::Runtime::OrSymbol))
      end
      attr_reader :runtime

      sig do
        params(runtime: Zavudev::FunctionCreateParams::Runtime::OrSymbol).void
      end
      attr_writer :runtime

      # TypeScript source code for the function entry point (max ~900KB).
      sig { returns(T.nilable(String)) }
      attr_reader :source_code

      sig { params(source_code: String).void }
      attr_writer :source_code

      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_sec

      sig { params(timeout_sec: Integer).void }
      attr_writer :timeout_sec

      sig do
        params(
          name: String,
          slug: String,
          dependencies: T::Hash[Symbol, String],
          description: String,
          http_enabled: T::Boolean,
          memory_mb: Zavudev::FunctionCreateParams::MemoryMB::OrInteger,
          runtime: Zavudev::FunctionCreateParams::Runtime::OrSymbol,
          source_code: String,
          timeout_sec: Integer,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        name:,
        # URL-safe identifier (lowercase, digits, hyphens). Must be unique per project.
        slug:,
        # npm dependencies. Keys are package names, values are semver ranges.
        dependencies: nil,
        description: nil,
        # Whether to expose a public HTTPS URL for this function.
        http_enabled: nil,
        memory_mb: nil,
        # Runtime the function is deployed on.
        runtime: nil,
        # TypeScript source code for the function entry point (max ~900KB).
        source_code: nil,
        timeout_sec: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            slug: String,
            dependencies: T::Hash[Symbol, String],
            description: String,
            http_enabled: T::Boolean,
            memory_mb: Zavudev::FunctionCreateParams::MemoryMB::OrInteger,
            runtime: Zavudev::FunctionCreateParams::Runtime::OrSymbol,
            source_code: String,
            timeout_sec: Integer,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end

      module MemoryMB
        extend Zavudev::Internal::Type::Enum

        TaggedInteger =
          T.type_alias do
            T.all(Integer, Zavudev::FunctionCreateParams::MemoryMB)
          end
        OrInteger = T.type_alias { Integer }

        MEMORY_MB_128 =
          T.let(128, Zavudev::FunctionCreateParams::MemoryMB::TaggedInteger)
        MEMORY_MB_256 =
          T.let(256, Zavudev::FunctionCreateParams::MemoryMB::TaggedInteger)
        MEMORY_MB_512 =
          T.let(512, Zavudev::FunctionCreateParams::MemoryMB::TaggedInteger)
        MEMORY_MB_1024 =
          T.let(1024, Zavudev::FunctionCreateParams::MemoryMB::TaggedInteger)

        sig do
          override.returns(
            T::Array[Zavudev::FunctionCreateParams::MemoryMB::TaggedInteger]
          )
        end
        def self.values
        end
      end

      # Runtime the function is deployed on.
      module Runtime
        extend Zavudev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Zavudev::FunctionCreateParams::Runtime) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NODEJS24 =
          T.let(:nodejs24, Zavudev::FunctionCreateParams::Runtime::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Zavudev::FunctionCreateParams::Runtime::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
