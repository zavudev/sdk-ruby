# typed: strong

module Zavudev
  module Models
    module Functions
      class GitLinkUpdateParams < Zavudev::Internal::Type::BaseModel
        extend Zavudev::Internal::Type::RequestParameters::Converter
        include Zavudev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Functions::GitLinkUpdateParams,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :function_id

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :auto_deploy

        sig { params(auto_deploy: T::Boolean).void }
        attr_writer :auto_deploy

        sig { returns(T.nilable(String)) }
        attr_reader :branch

        sig { params(branch: String).void }
        attr_writer :branch

        sig { returns(T.nilable(String)) }
        attr_accessor :root_dir

        sig do
          params(
            function_id: String,
            auto_deploy: T::Boolean,
            branch: String,
            root_dir: T.nilable(String),
            request_options: Zavudev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          function_id:,
          auto_deploy: nil,
          branch: nil,
          root_dir: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              function_id: String,
              auto_deploy: T::Boolean,
              branch: String,
              root_dir: T.nilable(String),
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
