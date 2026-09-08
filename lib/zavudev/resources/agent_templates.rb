# frozen_string_literal: true

module Zavudev
  module Resources
    class AgentTemplates
      # Fetch a single factory agent fully rendered: the function files to scaffold (an
      # `index.ts` that declares the agent with `defineAgent` and its skills with
      # `defineTool`) plus the secrets it needs. This is what
      # `npx zavudev agents pull <id>` writes to disk before `npx zavudev deploy`.
      #
      # @overload retrieve(template_id, request_options: {})
      #
      # @param template_id [String]
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::AgentTemplateRetrieveResponse]
      #
      # @see Zavudev::Models::AgentTemplateRetrieveParams
      def retrieve(template_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/agent-templates/%1$s", template_id],
          model: Zavudev::Models::AgentTemplateRetrieveResponse,
          options: params[:request_options]
        )
      end

      # List the factory agents available to scaffold with `npx zavudev agents pull`.
      # Each entry is a ready-made voice or text agent (system prompt, skills, and — for
      # voice agents — a co-located voice config).
      #
      # @overload list(request_options: {})
      #
      # @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Zavudev::Models::AgentTemplateListResponse]
      #
      # @see Zavudev::Models::AgentTemplateListParams
      def list(params = {})
        @client.request(
          method: :get,
          path: "v1/agent-templates",
          model: Zavudev::Models::AgentTemplateListResponse,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Zavudev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
