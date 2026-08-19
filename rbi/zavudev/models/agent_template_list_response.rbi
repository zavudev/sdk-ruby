# typed: strong

module Zavudev
  module Models
    class AgentTemplateListResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Zavudev::Models::AgentTemplateListResponse,
            Zavudev::Internal::AnyHash
          )
        end

      sig do
        returns(T::Array[Zavudev::Models::AgentTemplateListResponse::Item])
      end
      attr_accessor :items

      sig do
        params(
          items:
            T::Array[Zavudev::Models::AgentTemplateListResponse::Item::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(items:)
      end

      sig do
        override.returns(
          { items: T::Array[Zavudev::Models::AgentTemplateListResponse::Item] }
        )
      end
      def to_hash
      end

      class Item < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::AgentTemplateListResponse::Item,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            Zavudev::Models::AgentTemplateListResponse::Item::Category::TaggedSymbol
          )
        end
        attr_accessor :category

        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :summary

        sig { returns(Integer) }
        attr_accessor :tool_count

        # Whether this agent answers phone calls.
        sig { returns(T::Boolean) }
        attr_accessor :voice

        # Compact catalog entry for a factory agent.
        sig do
          params(
            id: String,
            category:
              Zavudev::Models::AgentTemplateListResponse::Item::Category::OrSymbol,
            name: String,
            summary: String,
            tool_count: Integer,
            voice: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          category:,
          name:,
          summary:,
          tool_count:,
          # Whether this agent answers phone calls.
          voice:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              category:
                Zavudev::Models::AgentTemplateListResponse::Item::Category::TaggedSymbol,
              name: String,
              summary: String,
              tool_count: Integer,
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
                Zavudev::Models::AgentTemplateListResponse::Item::Category
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SALES =
            T.let(
              :sales,
              Zavudev::Models::AgentTemplateListResponse::Item::Category::TaggedSymbol
            )
          SUPPORT =
            T.let(
              :support,
              Zavudev::Models::AgentTemplateListResponse::Item::Category::TaggedSymbol
            )
          FRONT_DESK =
            T.let(
              :frontDesk,
              Zavudev::Models::AgentTemplateListResponse::Item::Category::TaggedSymbol
            )
          OPS =
            T.let(
              :ops,
              Zavudev::Models::AgentTemplateListResponse::Item::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Zavudev::Models::AgentTemplateListResponse::Item::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
