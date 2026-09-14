# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::AgentTemplates#retrieve
    class AgentTemplateRetrieveResponse < Zavudev::Internal::Type::BaseModel
      # @!attribute template
      #   A fully rendered factory agent: the function files to scaffold plus the secrets
      #   it needs. Returned by GET /v1/agent-templates/{templateId} and consumed by
      #   `npx zavudev agents pull`.
      #
      #   @return [Zavudev::Models::AgentTemplateRetrieveResponse::Template]
      required :template, -> { Zavudev::Models::AgentTemplateRetrieveResponse::Template }

      # @!method initialize(template:)
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::AgentTemplateRetrieveResponse} for more details.
      #
      #   @param template [Zavudev::Models::AgentTemplateRetrieveResponse::Template] A fully rendered factory agent: the function files to scaffold plus the secrets

      # @see Zavudev::Models::AgentTemplateRetrieveResponse#template
      class Template < Zavudev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute category
        #
        #   @return [Symbol, Zavudev::Models::AgentTemplateRetrieveResponse::Template::Category]
        required :category, enum: -> { Zavudev::Models::AgentTemplateRetrieveResponse::Template::Category }

        # @!attribute default_slug
        #
        #   @return [String]
        required :default_slug, String, api_name: :defaultSlug

        # @!attribute dependencies
        #   npm dependencies for the scaffolded function.
        #
        #   @return [Hash{Symbol=>String}]
        required :dependencies, Zavudev::Internal::Type::HashOf[String]

        # @!attribute files
        #
        #   @return [Array<Zavudev::Models::AgentTemplateRetrieveResponse::Template::File>]
        required :files,
                 -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::AgentTemplateRetrieveResponse::Template::File] }

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute required_secrets
        #
        #   @return [Array<Zavudev::Models::AgentTemplateRetrieveResponse::Template::RequiredSecret>]
        required :required_secrets,
                 -> { Zavudev::Internal::Type::ArrayOf[Zavudev::Models::AgentTemplateRetrieveResponse::Template::RequiredSecret] },
                 api_name: :requiredSecrets

        # @!attribute summary
        #
        #   @return [String]
        required :summary, String

        # @!attribute voice
        #
        #   @return [Boolean]
        required :voice, Zavudev::Internal::Type::Boolean

        # @!method initialize(id:, category:, default_slug:, dependencies:, files:, name:, required_secrets:, summary:, voice:)
        #   A fully rendered factory agent: the function files to scaffold plus the secrets
        #   it needs. Returned by GET /v1/agent-templates/{templateId} and consumed by
        #   `npx zavudev agents pull`.
        #
        #   @param id [String]
        #
        #   @param category [Symbol, Zavudev::Models::AgentTemplateRetrieveResponse::Template::Category]
        #
        #   @param default_slug [String]
        #
        #   @param dependencies [Hash{Symbol=>String}] npm dependencies for the scaffolded function.
        #
        #   @param files [Array<Zavudev::Models::AgentTemplateRetrieveResponse::Template::File>]
        #
        #   @param name [String]
        #
        #   @param required_secrets [Array<Zavudev::Models::AgentTemplateRetrieveResponse::Template::RequiredSecret>]
        #
        #   @param summary [String]
        #
        #   @param voice [Boolean]

        # @see Zavudev::Models::AgentTemplateRetrieveResponse::Template#category
        module Category
          extend Zavudev::Internal::Type::Enum

          SALES = :sales
          SUPPORT = :support
          FRONT_DESK = :frontDesk
          OPS = :ops

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class File < Zavudev::Internal::Type::BaseModel
          # @!attribute content
          #   File contents to write verbatim.
          #
          #   @return [String]
          required :content, String

          # @!attribute path
          #
          #   @return [String]
          required :path, String

          # @!method initialize(content:, path:)
          #   @param content [String] File contents to write verbatim.
          #
          #   @param path [String]
        end

        class RequiredSecret < Zavudev::Internal::Type::BaseModel
          # @!attribute hint
          #
          #   @return [String]
          required :hint, String

          # @!attribute key
          #
          #   @return [String]
          required :key, String

          # @!method initialize(hint:, key:)
          #   @param hint [String]
          #   @param key [String]
        end
      end
    end
  end
end
