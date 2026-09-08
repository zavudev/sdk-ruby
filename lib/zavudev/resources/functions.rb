# frozen_string_literal: true

module Zavudev
  module Resources
    class Functions
      # @return [Zavudev::Resources::Functions::Secrets]
      attr_reader :secrets

      # @return [Zavudev::Resources::Functions::Triggers]
      attr_reader :triggers

      # @return [Zavudev::Resources::Functions::GitLink]
      attr_reader :git_link

      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::FunctionCreateParams} for more details.
      #
      # Create a new Zavu Function. The function starts in `draft` status. A dedicated
      # API key is auto-provisioned and injected as the `ZAVU_API_KEY` secret so the
      # function can call back into the Zavu API without manual setup.
      #
      # Provide `sourceCode` to seed the draft. Call
      # `POST /v1/functions/{functionId}/deploy` afterwards to publish.
      #
      # @overload create(name:, slug:, dependencies: nil, description: nil, entrypoint: nil, files: nil, http_enabled: nil, memory_mb: nil, runtime: nil, source_code: nil, timeout_sec: nil, request_options: {})
      #
      # @param name [String]
      #
      # @param slug [String] URL-safe identifier (lowercase, digits, hyphens). Must be unique per project.
      #
      # @param dependencies [Hash{Symbol=>String}] npm dependencies. Keys are package names, values are semver ranges.
      #
      # @param description [String]
      #
      # @param entrypoint [String] Which file in `files` is the entry point. Defaults to `index.ts`.
      #
      # @param files [Hash{Symbol=>String}] The project's source files, keyed by path relative to the project root (e.g. `in
      #
      # @param http_enabled [Boolean] Whether to expose a public HTTPS URL for this function.
      #
      # @param memory_mb [Integer, Zavudev::Models::FunctionCreateParams::MemoryMB]
      #
      # @param runtime [Symbol, Zavudev::Models::FunctionCreateParams::Runtime] Runtime the function is deployed on.
      #
      # @param source_code [String] Shortcut for a single-file function: exactly equivalent to sending `files` with
      #
      # @param timeout_sec [Integer] Per-invocation timeout in seconds. Event and cron invocations are asynchronous,
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::FunctionCreateResponse]
      #
      # @see Zavudev::Models::FunctionCreateParams
      def create(params)
        parsed, options = Zavudev::FunctionCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/functions",
          body: parsed,
          model: Zavudev::Models::FunctionCreateResponse,
          options: options
        )
      end

      # Get function
      #
      # @overload retrieve(function_id, request_options: {})
      #
      # @param function_id [String] Zavu Function ID.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::FunctionRetrieveResponse]
      #
      # @see Zavudev::Models::FunctionRetrieveParams
      def retrieve(function_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/functions/%1$s", function_id],
          model: Zavudev::Models::FunctionRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::FunctionUpdateParams} for more details.
      #
      # Update an existing function. `sourceCode` / `dependencies` edit the draft
      # without triggering a build — they go live on the next
      # `POST /v1/functions/{functionId}/deploy`. `httpEnabled` is applied to the
      # deployed function immediately, so turning the public endpoint on or off does not
      # require a redeploy.
      #
      # @overload update(function_id, dependencies: nil, entrypoint: nil, files: nil, http_enabled: nil, source_code: nil, request_options: {})
      #
      # @param function_id [String] Zavu Function ID.
      #
      # @param dependencies [Hash{Symbol=>String}] New dependency map (replaces existing dependencies).
      #
      # @param entrypoint [String] Which file in `files` is the entry point. Defaults to `index.ts`.
      #
      # @param files [Hash{Symbol=>String}] The project's source files, keyed by path relative to the project root (e.g. `in
      #
      # @param http_enabled [Boolean] Expose the function on its public HTTPS URL, or take it down. Applies to the alr
      #
      # @param source_code [String] Shortcut for a single-file function: exactly equivalent to sending `files` with
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::FunctionUpdateResponse]
      #
      # @see Zavudev::Models::FunctionUpdateParams
      def update(function_id, params = {})
        parsed, options = Zavudev::FunctionUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/functions/%1$s", function_id],
          body: parsed,
          model: Zavudev::Models::FunctionUpdateResponse,
          options: options
        )
      end

      # Permanently delete a function and cascade: triggers, secrets, deployment
      # history, managed agents+tools, and revoke the auto-provisioned API key. The AWS
      # Lambda + log group are torn down asynchronously.
      #
      # @overload delete(function_id, request_options: {})
      #
      # @param function_id [String] Zavu Function ID.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::FunctionDeleteResponse]
      #
      # @see Zavudev::Models::FunctionDeleteParams
      def delete(function_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/functions/%1$s", function_id],
          model: Zavudev::Models::FunctionDeleteResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Zavudev::Models::FunctionDeployParams} for more details.
      #
      # Publish the function. If `sourceCode` or `dependencies` are provided in the
      # body, they replace the current draft before deployment. Returns immediately with
      # a deployment ID — poll `GET /v1/functions/deployments/{deploymentId}` until
      # status is `active` or `failed`.
      #
      # @overload deploy(function_id, dependencies: nil, entrypoint: nil, files: nil, source_code: nil, request_options: {})
      #
      # @param function_id [String] Zavu Function ID.
      #
      # @param dependencies [Hash{Symbol=>String}] New dependency map (replaces existing dependencies).
      #
      # @param entrypoint [String] Which file in `files` is the entry point. Defaults to `index.ts`.
      #
      # @param files [Hash{Symbol=>String}] The project's source files, keyed by path relative to the project root (e.g. `in
      #
      # @param source_code [String] Shortcut for a single-file function: exactly equivalent to sending `files` with
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::FunctionDeployResponse]
      #
      # @see Zavudev::Models::FunctionDeployParams
      def deploy(function_id, params = {})
        parsed, options = Zavudev::FunctionDeployParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/functions/%1$s/deploy", function_id],
          body: parsed,
          model: Zavudev::Models::FunctionDeployResponse,
          options: options
        )
      end

      # Fetch a deployment to poll its status during a deploy.
      #
      # @overload get_deployment(deployment_id, request_options: {})
      #
      # @param deployment_id [String] Function deployment ID.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::FunctionGetDeploymentResponse]
      #
      # @see Zavudev::Models::FunctionGetDeploymentParams
      def get_deployment(deployment_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/functions/deployments/%1$s", deployment_id],
          model: Zavudev::Models::FunctionGetDeploymentResponse,
          options: params[:request_options]
        )
      end

      # List a function's deployment history, newest first. Source code is omitted;
      # fetch a single deployment via GET /v1/functions/deployments/{deploymentId} for
      # full details.
      #
      # @overload list_deployments(function_id, limit: nil, request_options: {})
      #
      # @param function_id [String] Zavu Function ID.
      #
      # @param limit [Integer]
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::FunctionListDeploymentsResponse]
      #
      # @see Zavudev::Models::FunctionListDeploymentsParams
      def list_deployments(function_id, params = {})
        parsed, options = Zavudev::FunctionListDeploymentsParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["v1/functions/%1$s/deployments", function_id],
          query: query,
          model: Zavudev::Models::FunctionListDeploymentsResponse,
          options: options
        )
      end

      # List the event types a function trigger can subscribe to. Includes the special
      # type `cron`, which fires on a schedule (see POST
      # /v1/functions/{functionId}/triggers) rather than on a messaging event.
      #
      # @overload list_event_types(request_options: {})
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::FunctionListEventTypesResponse]
      #
      # @see Zavudev::Models::FunctionListEventTypesParams
      def list_event_types(params = {})
        @client.request(
          method: :get,
          path: "v1/functions/event-types",
          model: Zavudev::Models::FunctionListEventTypesResponse,
          options: params[:request_options]
        )
      end

      # Re-deploy a previous version by copying its source, dependencies, and runtime
      # pin onto the function's draft, then deploying. Returns immediately with a
      # deployment ID — poll GET /v1/functions/deployments/{deploymentId} until status
      # is active or failed. Secrets are not rolled back.
      #
      # @overload rollback_deployment(function_id, deployment_id:, request_options: {})
      #
      # @param function_id [String] Zavu Function ID.
      #
      # @param deployment_id [String] ID of the deployment to roll back to.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::FunctionRollbackDeploymentResponse]
      #
      # @see Zavudev::Models::FunctionRollbackDeploymentParams
      def rollback_deployment(function_id, params)
        parsed, options = Zavudev::FunctionRollbackDeploymentParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/functions/%1$s/rollback", function_id],
          body: parsed,
          model: Zavudev::Models::FunctionRollbackDeploymentResponse,
          options: options
        )
      end

      # Fetch invocation logs for a function. Logs are paginated via `nextToken`. Pass
      # `startTime` / `endTime` (Unix epoch milliseconds) to bound the window, or
      # `filterPattern` to filter messages.
      #
      # @overload tail_logs(function_id, end_time: nil, filter_pattern: nil, limit: nil, next_token: nil, start_time: nil, request_options: {})
      #
      # @param function_id [String] Zavu Function ID.
      #
      # @param end_time [Integer] End of the log window in Unix epoch milliseconds.
      #
      # @param filter_pattern [String]
      #
      # @param limit [Integer]
      #
      # @param next_token [String]
      #
      # @param start_time [Integer] Start of the log window in Unix epoch milliseconds.
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::FunctionTailLogsResponse]
      #
      # @see Zavudev::Models::FunctionTailLogsParams
      def tail_logs(function_id, params = {})
        parsed, options = Zavudev::FunctionTailLogsParams.dump_request(params)
        query = Zavudev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["v1/functions/%1$s/logs", function_id],
          query: query.transform_keys(
            end_time: "endTime",
            filter_pattern: "filterPattern",
            next_token: "nextToken",
            start_time: "startTime"
          ),
          model: Zavudev::Models::FunctionTailLogsResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Zavudev::Client]
      def initialize(client:)
        @client = client
        @secrets = Zavudev::Resources::Functions::Secrets.new(client: client)
        @triggers = Zavudev::Resources::Functions::Triggers.new(client: client)
        @git_link = Zavudev::Resources::Functions::GitLink.new(client: client)
      end
    end
  end
end
