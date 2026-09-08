# typed: strong

module Zavudev
  module Resources
    class AgentTemplates
      # Fetch a single factory agent fully rendered: the function files to scaffold (an
      # `index.ts` that declares the agent with `defineAgent` and its skills with
      # `defineTool`) plus the secrets it needs. This is what
      # `npx zavudev agents pull <id>` writes to disk before `npx zavudev deploy`.
      sig do
        params(
          template_id: String,
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(Zavudev::Models::AgentTemplateRetrieveResponse)
      end
      def retrieve(template_id, request_options: {})
      end

      # List the factory agents available to scaffold with `npx zavudev agents pull`.
      # Each entry is a ready-made voice or text agent (system prompt, skills, and — for
      # voice agents — a co-located voice config).
      sig do
        params(request_options: Zavudev::RequestOptions::OrHash).returns(
          Zavudev::Models::AgentTemplateListResponse
        )
      end
      def list(request_options: {})
      end

      # @api private
      sig { params(client: Zavudev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
