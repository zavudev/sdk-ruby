# typed: strong

module Zavudev
  module Models
    module Senders
      module Agent
        module KnowledgeBases
          class DocumentCreateParams < Zavudev::Internal::Type::BaseModel
            extend Zavudev::Internal::Type::RequestParameters::Converter
            include Zavudev::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Zavudev::Senders::Agent::KnowledgeBases::DocumentCreateParams,
                  Zavudev::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :sender_id

            sig { returns(String) }
            attr_accessor :kb_id

            sig { returns(String) }
            attr_accessor :content

            sig { returns(String) }
            attr_accessor :title

            sig do
              params(
                sender_id: String,
                kb_id: String,
                content: String,
                title: String,
                request_options: Zavudev::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              sender_id:,
              kb_id:,
              content:,
              title:,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  sender_id: String,
                  kb_id: String,
                  content: String,
                  title: String,
                  request_options: Zavudev::RequestOptions
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
end
