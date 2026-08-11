# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#deploy
    class FunctionDeployParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute function_id
      #
      #   @return [String]
      required :function_id, String

      # @!attribute dependencies
      #   New dependency map (replaces existing dependencies).
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :dependencies, Zavudev::Internal::Type::HashOf[String]

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

      # @!attribute source_code
      #   Shortcut for a single-file function: exactly equivalent to sending `files` with
      #   one entry named after `entrypoint` (`index.ts` by default). Fully supported —
      #   use whichever fits. If both are sent, `files` wins.
      #
      #   @return [String, nil]
      optional :source_code, String, api_name: :sourceCode

      # @!method initialize(function_id:, dependencies: nil, entrypoint: nil, files: nil, source_code: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::FunctionDeployParams} for more details.
      #
      #   @param function_id [String]
      #
      #   @param dependencies [Hash{Symbol=>String}] New dependency map (replaces existing dependencies).
      #
      #   @param entrypoint [String] Which file in `files` is the entry point. Defaults to `index.ts`.
      #
      #   @param files [Hash{Symbol=>String}] The project's source files, keyed by path relative to the project root (e.g. `in
      #
      #   @param source_code [String] Shortcut for a single-file function: exactly equivalent to sending `files` with
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
