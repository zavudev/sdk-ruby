# typed: strong

module Zavudev
  module Models
    class FunctionDeployParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::FunctionDeployParams, Zavudev::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :function_id

      # New dependency map (replaces existing dependencies).
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :dependencies

      sig { params(dependencies: T::Hash[Symbol, String]).void }
      attr_writer :dependencies

      # Which file in `files` is the entry point. Defaults to `index.ts`.
      sig { returns(T.nilable(String)) }
      attr_reader :entrypoint

      sig { params(entrypoint: String).void }
      attr_writer :entrypoint

      # The project's source files, keyed by path relative to the project root (e.g.
      # `index.ts`, `lib/orders.ts`). Imports between them are resolved when the
      # function is built, so a function can be split across as many files as it needs.
      #
      # Paths must be relative and use forward slashes; `..`, `node_modules/` and
      # `package.json` are rejected. npm packages are not uploaded here — declare them
      # under `dependencies` and Zavu installs them. Limits: 200 files and 900,000 bytes
      # for the whole tree.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :files

      sig { params(files: T::Hash[Symbol, String]).void }
      attr_writer :files

      # Shortcut for a single-file function: exactly equivalent to sending `files` with
      # one entry named after `entrypoint` (`index.ts` by default). Fully supported —
      # use whichever fits. If both are sent, `files` wins.
      sig { returns(T.nilable(String)) }
      attr_reader :source_code

      sig { params(source_code: String).void }
      attr_writer :source_code

      sig do
        params(
          function_id: String,
          dependencies: T::Hash[Symbol, String],
          entrypoint: String,
          files: T::Hash[Symbol, String],
          source_code: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        function_id:,
        # New dependency map (replaces existing dependencies).
        dependencies: nil,
        # Which file in `files` is the entry point. Defaults to `index.ts`.
        entrypoint: nil,
        # The project's source files, keyed by path relative to the project root (e.g.
        # `index.ts`, `lib/orders.ts`). Imports between them are resolved when the
        # function is built, so a function can be split across as many files as it needs.
        #
        # Paths must be relative and use forward slashes; `..`, `node_modules/` and
        # `package.json` are rejected. npm packages are not uploaded here — declare them
        # under `dependencies` and Zavu installs them. Limits: 200 files and 900,000 bytes
        # for the whole tree.
        files: nil,
        # Shortcut for a single-file function: exactly equivalent to sending `files` with
        # one entry named after `entrypoint` (`index.ts` by default). Fully supported —
        # use whichever fits. If both are sent, `files` wins.
        source_code: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            function_id: String,
            dependencies: T::Hash[Symbol, String],
            entrypoint: String,
            files: T::Hash[Symbol, String],
            source_code: String,
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
