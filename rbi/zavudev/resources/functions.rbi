# typed: strong

module Zavudev
  module Resources
    class Functions
      sig { returns(Zavudev::Resources::Functions::Secrets) }
      attr_reader :secrets

      # Create a new Zavu Function. The function starts in `draft` status. A dedicated
      # API key is auto-provisioned and injected as the `ZAVU_API_KEY` secret so the
      # function can call back into the Zavu API without manual setup.
      #
      # Provide `sourceCode` to seed the draft. Call
      # `POST /v1/functions/{functionId}/deploy` afterwards to publish.
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
        ).returns(Zavudev::Models::FunctionCreateResponse)
      end
      def create(
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
        # Per-invocation timeout in seconds. Event and cron invocations are asynchronous,
        # so a long timeout only bounds cost; a tool called during a live conversation
        # holds up the reply, and a function exposed over HTTP is additionally bounded by
        # the platform's HTTP response limit.
        timeout_sec: nil,
        request_options: {}
      )
      end

      # Get function
      sig do
        params(
          function_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::FunctionRetrieveResponse)
      end
      def retrieve(
        # Zavu Function ID.
        function_id,
        request_options: {}
      )
      end

      # Update an existing function. `sourceCode` / `dependencies` edit the draft
      # without triggering a build — they go live on the next
      # `POST /v1/functions/{functionId}/deploy`. `httpEnabled` is applied to the
      # deployed function immediately, so turning the public endpoint on or off does not
      # require a redeploy.
      sig do
        params(
          function_id: String,
          dependencies: T::Hash[Symbol, String],
          http_enabled: T::Boolean,
          source_code: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::FunctionUpdateResponse)
      end
      def update(
        # Zavu Function ID.
        function_id,
        # New dependency map (replaces existing dependencies).
        dependencies: nil,
        # Expose the function on its public HTTPS URL, or take it down. Applies to the
        # already-deployed function without redeploying; the URL is returned as
        # `publicUrl`.
        http_enabled: nil,
        # New source code for the draft (replaces it).
        source_code: nil,
        request_options: {}
      )
      end

      # Permanently delete a function and cascade: triggers, secrets, deployment
      # history, managed agents+tools, and revoke the auto-provisioned API key. The AWS
      # Lambda + log group are torn down asynchronously.
      sig do
        params(
          function_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::FunctionDeleteResponse)
      end
      def delete(
        # Zavu Function ID.
        function_id,
        request_options: {}
      )
      end

      # Publish the function. If `sourceCode` or `dependencies` are provided in the
      # body, they replace the current draft before deployment. Returns immediately with
      # a deployment ID — poll `GET /v1/functions/deployments/{deploymentId}` until
      # status is `active` or `failed`.
      sig do
        params(
          function_id: String,
          dependencies: T::Hash[Symbol, String],
          source_code: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::FunctionDeployResponse)
      end
      def deploy(
        # Zavu Function ID.
        function_id,
        # New dependency map (replaces existing dependencies).
        dependencies: nil,
        # New source code to publish (replaces the draft).
        source_code: nil,
        request_options: {}
      )
      end

      # Fetch a deployment to poll its status during a deploy.
      sig do
        params(
          deployment_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::FunctionGetDeploymentResponse)
      end
      def get_deployment(
        # Function deployment ID.
        deployment_id,
        request_options: {}
      )
      end

      # Fetch invocation logs for a function. Logs are paginated via `nextToken`. Pass
      # `startTime` / `endTime` (Unix epoch milliseconds) to bound the window, or
      # `filterPattern` to filter messages.
      sig do
        params(
          function_id: String,
          end_time: Integer,
          filter_pattern: String,
          limit: Integer,
          next_token: String,
          start_time: Integer,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::FunctionTailLogsResponse)
      end
      def tail_logs(
        # Zavu Function ID.
        function_id,
        # End of the log window in Unix epoch milliseconds.
        end_time: nil,
        filter_pattern: nil,
        limit: nil,
        next_token: nil,
        # Start of the log window in Unix epoch milliseconds.
        start_time: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
