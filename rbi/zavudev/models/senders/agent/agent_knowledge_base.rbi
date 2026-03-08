# typed: strong

module Zavudev
  module Models
    module Senders
      AgentKnowledgeBase = Agent::AgentKnowledgeBase

      module Agent
        class AgentKnowledgeBase < Zavudev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Zavudev::Senders::Agent::AgentKnowledgeBase,
                Zavudev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :agent_id

          sig { returns(Time) }
          attr_accessor :created_at

          sig { returns(Integer) }
          attr_accessor :document_count

          sig { returns(String) }
          attr_accessor :name

          sig { returns(Integer) }
          attr_accessor :total_chunks

          sig { returns(Time) }
          attr_accessor :updated_at

          sig { returns(T.nilable(String)) }
          attr_accessor :description

          sig do
            params(
              id: String,
              agent_id: String,
              created_at: Time,
              document_count: Integer,
              name: String,
              total_chunks: Integer,
              updated_at: Time,
              description: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            agent_id:,
            created_at:,
            document_count:,
            name:,
            total_chunks:,
            updated_at:,
            description: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                agent_id: String,
                created_at: Time,
                document_count: Integer,
                name: String,
                total_chunks: Integer,
                updated_at: Time,
                description: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
