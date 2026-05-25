# typed: strong

module Zavudev
  module Models
    class MeRetrieveResponse < Zavudev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Zavudev::Models::MeRetrieveResponse, Zavudev::Internal::AnyHash)
        end

      sig { returns(Zavudev::Models::MeRetrieveResponse::APIKey) }
      attr_reader :api_key

      sig do
        params(
          api_key: Zavudev::Models::MeRetrieveResponse::APIKey::OrHash
        ).void
      end
      attr_writer :api_key

      sig { returns(T::Boolean) }
      attr_accessor :is_test_mode

      sig { returns(Zavudev::Models::MeRetrieveResponse::Project) }
      attr_reader :project

      sig do
        params(
          project: Zavudev::Models::MeRetrieveResponse::Project::OrHash
        ).void
      end
      attr_writer :project

      sig { returns(Zavudev::Models::MeRetrieveResponse::Team) }
      attr_reader :team

      sig do
        params(team: Zavudev::Models::MeRetrieveResponse::Team::OrHash).void
      end
      attr_writer :team

      sig do
        params(
          api_key: Zavudev::Models::MeRetrieveResponse::APIKey::OrHash,
          is_test_mode: T::Boolean,
          project: Zavudev::Models::MeRetrieveResponse::Project::OrHash,
          team: Zavudev::Models::MeRetrieveResponse::Team::OrHash
        ).returns(T.attached_class)
      end
      def self.new(api_key:, is_test_mode:, project:, team:)
      end

      sig do
        override.returns(
          {
            api_key: Zavudev::Models::MeRetrieveResponse::APIKey,
            is_test_mode: T::Boolean,
            project: Zavudev::Models::MeRetrieveResponse::Project,
            team: Zavudev::Models::MeRetrieveResponse::Team
          }
        )
      end
      def to_hash
      end

      class APIKey < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::MeRetrieveResponse::APIKey,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { params(id: String).returns(T.attached_class) }
        def self.new(id:)
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end

      class Project < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::MeRetrieveResponse::Project,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T::Boolean) }
        attr_accessor :is_sub_account

        sig { returns(T.nilable(String)) }
        attr_accessor :name

        sig do
          params(
            id: String,
            is_sub_account: T::Boolean,
            name: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(id:, is_sub_account:, name:)
        end

        sig do
          override.returns(
            { id: String, is_sub_account: T::Boolean, name: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      class Team < Zavudev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Zavudev::Models::MeRetrieveResponse::Team,
              Zavudev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.nilable(String)) }
        attr_accessor :name

        sig do
          params(id: String, name: T.nilable(String)).returns(T.attached_class)
        end
        def self.new(id:, name:)
        end

        sig { override.returns({ id: String, name: T.nilable(String) }) }
        def to_hash
        end
      end
    end
  end
end
