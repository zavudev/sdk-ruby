# typed: strong

module Zavudev
  module Models
    class AgentTemplateRetrieveResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::AgentTemplateRetrieveResponse,
            Zavudev::Internal::AnyHash
          )
        end

      # A fully rendered factory agent: the function files to scaffold plus the secrets
      # it needs. Returned by GET /v1/agent-templates/{templateId} and consumed by
      # `npx zavudev agents pull`.
      sig { returns(Zavudev::Models::AgentTemplateRetrieveResponse::Template) }
      attr_reader :template

      sig do
        params(
          template:
            Zavudev::Models::AgentTemplateRetrieveResponse::Template::OrHash
        ).void
      end
      attr_writer :template

      sig do
        params(
          template:
            Zavudev::Models::AgentTemplateRetrieveResponse::Template::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A fully rendered factory agent: the function files to scaffold plus the secrets
        # it needs. Returned by GET /v1/agent-templates/{templateId} and consumed by
        # `npx zavudev agents pull`.
        template:
      )
      end

      sig do
        override.returns(
          { template: Zavudev::Models::AgentTemplateRetrieveResponse::Template }
        )
      end
      def to_hash
      end

      class Template < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::AgentTemplateRetrieveResponse::Template,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            Zavudev::Models::AgentTemplateRetrieveResponse::Template::Category::TaggedSymbol
          )
        end
        attr_accessor :category

        sig { returns(String) }
        attr_accessor :default_slug

        # npm dependencies for the scaffolded function.
        sig { returns(T::Hash[Symbol, String]) }
        attr_accessor :dependencies

        sig do
          returns(
            T::Array[
              Zavudev::Models::AgentTemplateRetrieveResponse::Template::File
            ]
          )
        end
        attr_accessor :files

        sig { returns(String) }
        attr_accessor :name

        sig do
          returns(
            T::Array[
              Zavudev::Models::AgentTemplateRetrieveResponse::Template::RequiredSecret
            ]
          )
        end
        attr_accessor :required_secrets

        sig { returns(String) }
        attr_accessor :summary

        sig { returns(T::Boolean) }
        attr_accessor :voice

        # A fully rendered factory agent: the function files to scaffold plus the secrets
        # it needs. Returned by GET /v1/agent-templates/{templateId} and consumed by
        # `npx zavudev agents pull`.
        sig do
          params(
            id: String,
            category:
              Zavudev::Models::AgentTemplateRetrieveResponse::Template::Category::OrSymbol,
            default_slug: String,
            dependencies: T::Hash[Symbol, String],
            files:
              T::Array[
                Zavudev::Models::AgentTemplateRetrieveResponse::Template::File::OrHash
              ],
            name: String,
            required_secrets:
              T::Array[
                Zavudev::Models::AgentTemplateRetrieveResponse::Template::RequiredSecret::OrHash
              ],
            summary: String,
            voice: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          category:,
          default_slug:,
          # npm dependencies for the scaffolded function.
          dependencies:,
          files:,
          name:,
          required_secrets:,
          summary:,
          voice:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              category:
                Zavudev::Models::AgentTemplateRetrieveResponse::Template::Category::TaggedSymbol,
              default_slug: String,
              dependencies: T::Hash[Symbol, String],
              files:
                T::Array[
                  Zavudev::Models::AgentTemplateRetrieveResponse::Template::File
                ],
              name: String,
              required_secrets:
                T::Array[
                  Zavudev::Models::AgentTemplateRetrieveResponse::Template::RequiredSecret
                ],
              summary: String,
              voice: T::Boolean
            }
          )
        end
        def to_hash
        end

        module Category
          extend Zavudev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Zavudev::Models::AgentTemplateRetrieveResponse::Template::Category
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SALES =
            T.let(
              :sales,
              Zavudev::Models::AgentTemplateRetrieveResponse::Template::Category::TaggedSymbol
            )
          SUPPORT =
            T.let(
              :support,
              Zavudev::Models::AgentTemplateRetrieveResponse::Template::Category::TaggedSymbol
            )
          FRONT_DESK =
            T.let(
              :frontDesk,
              Zavudev::Models::AgentTemplateRetrieveResponse::Template::Category::TaggedSymbol
            )
          OPS =
            T.let(
              :ops,
              Zavudev::Models::AgentTemplateRetrieveResponse::Template::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Models::AgentTemplateRetrieveResponse::Template::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class File < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::AgentTemplateRetrieveResponse::Template::File,
                Zavudev::Internal::AnyHash
              )
            end

          # File contents to write verbatim.
          sig { returns(String) }
          attr_accessor :content

          sig { returns(String) }
          attr_accessor :path

          sig do
            params(content: String, path: String).returns(T.attached_class)
          end
          def self.new(
            # File contents to write verbatim.
            content:,
            path:
          )
          end

          sig { override.returns({ content: String, path: String }) }
          def to_hash
          end
        end

        class RequiredSecret < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Models::AgentTemplateRetrieveResponse::Template::RequiredSecret,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :hint

          sig { returns(String) }
          attr_accessor :key

          sig { params(hint: String, key: String).returns(T.attached_class) }
          def self.new(hint:, key:)
          end

          sig { override.returns({ hint: String, key: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
