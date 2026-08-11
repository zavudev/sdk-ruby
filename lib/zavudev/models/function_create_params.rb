# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#create
    class FunctionCreateParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute name
      #
      #   @return [String]
      required :name, String

      # @!attribute slug
      #   URL-safe identifier (lowercase, digits, hyphens). Must be unique per project.
      #
      #   @return [String]
      required :slug, String

      # @!attribute dependencies
      #   npm dependencies. Keys are package names, values are semver ranges.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :dependencies, Zavudev::Internal::Type::HashOf[String]

      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute entrypoint
      #   Which file in `files` is the entry point. Defaults to `index.ts`.
      #
      #   @return [String, nil]
      optional :entrypoint, String

      # @!attribute files
      #   The project's source files, keyed by path relative to the project root (e.g.
      #   `index.ts`, `lib/orders.ts`). Imports between them are resolved when the
      #   function is built, so a function can be split across as many files as it needs.
      #
      #   Paths must be relative and use forward slashes; `..`, `node_modules/` and
      #   `package.json` are rejected. npm packages are not uploaded here — declare them
      #   under `dependencies` and Zavu installs them. Limits: 200 files and 900,000 bytes
      #   for the whole tree.
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :files, Zavudev::Internal::Type::HashOf[String]

      # @!attribute http_enabled
      #   Whether to expose a public HTTPS URL for this function.
      #
      #   @return [Boolean, nil]
      optional :http_enabled, Zavudev::Internal::Type::Boolean, api_name: :httpEnabled

      # @!attribute memory_mb
      #
      #   @return [Integer, Zavudev::Models::FunctionCreateParams::MemoryMB, nil]
      optional :memory_mb, enum: -> { Zavudev::FunctionCreateParams::MemoryMB }, api_name: :memoryMb

      # @!attribute runtime
      #   Runtime the function is deployed on.
      #
      #   @return [Symbol, Zavudev::Models::FunctionCreateParams::Runtime, nil]
      optional :runtime, enum: -> { Zavudev::FunctionCreateParams::Runtime }

      # @!attribute source_code
      #   Shortcut for a single-file function: exactly equivalent to sending `files` with
      #   one entry named after `entrypoint` (`index.ts` by default). Fully supported —
      #   use whichever fits. If both are sent, `files` wins.
      #
      #   @return [String, nil]
      optional :source_code, String, api_name: :sourceCode

      # @!attribute timeout_sec
      #   Per-invocation timeout in seconds. Event and cron invocations are asynchronous,
      #   so a long timeout only bounds cost; a tool called during a live conversation
      #   holds up the reply, and a function exposed over HTTP is additionally bounded by
      #   the platform's HTTP response limit.
      #
      #   @return [Integer, nil]
      optional :timeout_sec, Integer, api_name: :timeoutSec

      # @!method initialize(name:, slug:, dependencies: nil, description: nil, entrypoint: nil, files: nil, http_enabled: nil, memory_mb: nil, runtime: nil, source_code: nil, timeout_sec: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::FunctionCreateParams} for more details.
      #
      #   @param name [String]
      #
      #   @param slug [String] URL-safe identifier (lowercase, digits, hyphens). Must be unique per project.
      #
      #   @param dependencies [Hash{Symbol=>String}] npm dependencies. Keys are package names, values are semver ranges.
      #
      #   @param description [String]
      #
      #   @param entrypoint [String] Which file in `files` is the entry point. Defaults to `index.ts`.
      #
      #   @param files [Hash{Symbol=>String}] The project's source files, keyed by path relative to the project root (e.g. `in
      #
      #   @param http_enabled [Boolean] Whether to expose a public HTTPS URL for this function.
      #
      #   @param memory_mb [Integer, Zavudev::Models::FunctionCreateParams::MemoryMB]
      #
      #   @param runtime [Symbol, Zavudev::Models::FunctionCreateParams::Runtime] Runtime the function is deployed on.
      #
      #   @param source_code [String] Shortcut for a single-file function: exactly equivalent to sending `files` with
      #
      #   @param timeout_sec [Integer] Per-invocation timeout in seconds. Event and cron invocations are asynchronous,
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]

      module MemoryMB
        extend Zavudev::Internal::Type::Enum

        MEMORY_MB_128 = 128
        MEMORY_MB_256 = 256
        MEMORY_MB_512 = 512
        MEMORY_MB_1024 = 1024

        # @!method self.values
        #   @return [Array<Integer>]
      end

      # Runtime the function is deployed on.
      module Runtime
        extend Zavudev::Internal::Type::Enum

        NODEJS24 = :nodejs24

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
