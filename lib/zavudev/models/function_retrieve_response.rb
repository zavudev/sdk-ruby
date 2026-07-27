# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Functions#retrieve
    class FunctionRetrieveResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute function
      #   A Zavu Function — user-supplied TypeScript that runs in Zavu Cloud and reacts to
      #   messaging events or HTTP requests.
      #
      #   @return [Zavudev::Models::FunctionRetrieveResponse::Function]
      required :function, -> { Zavudev::Models::FunctionRetrieveResponse::Function }

      # @!method initialize(function:)
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::FunctionRetrieveResponse} for more details.
      #
      #   @param function [Zavudev::Models::FunctionRetrieveResponse::Function] A Zavu Function — user-supplied TypeScript that runs in Zavu Cloud and reacts to

      # @see Zavudev::Models::FunctionRetrieveResponse#function
      class Function < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute dependencies
        #   npm dependencies installed in the function bundle. Keys are package names,
        #   values are semver ranges.
        #
        #   @return [Hash{Symbol=>String}]
        required :dependencies, Zavudev::Internal::Type::HashOf[String]

        # @!attribute http_enabled
        #   Whether the function can be invoked over HTTPS via its public URL.
        #
        #   @return [Boolean]
        required :http_enabled, Zavudev::Internal::Type::Boolean, api_name: :httpEnabled

        # @!attribute memory_mb
        #   Memory allocation in MB.
        #
        #   @return [Integer]
        required :memory_mb, Integer, api_name: :memoryMb

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute runtime
        #   Runtime the function is deployed on.
        #
        #   @return [Symbol, Zavudev::Models::FunctionRetrieveResponse::Function::Runtime]
        required :runtime, enum: -> { Zavudev::Models::FunctionRetrieveResponse::Function::Runtime }

        # @!attribute slug
        #   URL-safe identifier, unique per project.
        #
        #   @return [String]
        required :slug, String

        # @!attribute status
        #   Lifecycle status of a Zavu Function.
        #
        #   @return [Symbol, Zavudev::Models::FunctionRetrieveResponse::Function::Status]
        required :status, enum: -> { Zavudev::Models::FunctionRetrieveResponse::Function::Status }

        # @!attribute timeout_sec
        #   Per-invocation timeout in seconds.
        #
        #   @return [Integer]
        required :timeout_sec, Integer, api_name: :timeoutSec

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!attribute active_deployment_id
        #   ID of the deployment currently serving traffic.
        #
        #   @return [String, nil]
        optional :active_deployment_id, String, api_name: :activeDeploymentId, nil?: true

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute public_url
        #   HTTPS endpoint, present only while httpEnabled is true. Null otherwise,
        #   including for a function that was previously exposed — the stored URL stops
        #   serving the moment HTTP is turned off, so it is never returned.
        #
        #   @return [String, nil]
        optional :public_url, String, api_name: :publicUrl, nil?: true

        # @!method initialize(id:, created_at:, dependencies:, http_enabled:, memory_mb:, name:, runtime:, slug:, status:, timeout_sec:, updated_at:, active_deployment_id: nil, description: nil, public_url: nil)
        #   Some parameter documentations has been truncated, see
        #   {Zavudev::Models::FunctionRetrieveResponse::Function} for more details.
        #
        #   A Zavu Function — user-supplied TypeScript that runs in Zavu Cloud and reacts to
        #   messaging events or HTTP requests.
        #
        #   @param id [String]
        #
        #   @param created_at [Time]
        #
        #   @param dependencies [Hash{Symbol=>String}] npm dependencies installed in the function bundle. Keys are package names, value
        #
        #   @param http_enabled [Boolean] Whether the function can be invoked over HTTPS via its public URL.
        #
        #   @param memory_mb [Integer] Memory allocation in MB.
        #
        #   @param name [String]
        #
        #   @param runtime [Symbol, Zavudev::Models::FunctionRetrieveResponse::Function::Runtime] Runtime the function is deployed on.
        #
        #   @param slug [String] URL-safe identifier, unique per project.
        #
        #   @param status [Symbol, Zavudev::Models::FunctionRetrieveResponse::Function::Status] Lifecycle status of a Zavu Function.
        #
        #   @param timeout_sec [Integer] Per-invocation timeout in seconds.
        #
        #   @param updated_at [Time]
        #
        #   @param active_deployment_id [String, nil] ID of the deployment currently serving traffic.
        #
        #   @param description [String, nil]
        #
        #   @param public_url [String, nil] HTTPS endpoint, present only while httpEnabled is true. Null otherwise, includin

        # Runtime the function is deployed on.
        #
        # @see Zavudev::Models::FunctionRetrieveResponse::Function#runtime
        module Runtime
          extend Zavudev::Internal::Type::Enum

          NODEJS24 = :nodejs24

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Lifecycle status of a Zavu Function.
        #
        # @see Zavudev::Models::FunctionRetrieveResponse::Function#status
        module Status
          extend Zavudev::Internal::Type::Enum

          DRAFT = :draft
          BUNDLING = :bundling
          DEPLOYING = :deploying
          ACTIVE = :active
          FAILED = :failed
          DISABLED = :disabled

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
