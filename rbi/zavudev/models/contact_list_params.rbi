# typed: strong

module Zavudev
  module Models
    class ContactListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Zavudev::ContactListParams, Zavudev::Internal::AnyHash)
        end

      # Opaque cursor from a previous response's `nextCursor`. Do not construct it.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Exact match on the contact's primary phone number, in E.164.
      sig { returns(T.nilable(String)) }
      attr_reader :phone_number

      sig { params(phone_number: String).void }
      attr_writer :phone_number

      # Free-text match over the contact's name (`displayName` and the WhatsApp profile
      # name), phone numbers and email addresses. Case- and accent-insensitive. A phone
      # number matches on a trailing fragment too, so `5551234` finds `+14155551234`.
      #
      # Contacts created automatically from an inbound message have no `displayName` —
      # they are matched by their identifier until you set one with
      # `PATCH /v1/contacts/{contactId}`.
      #
      # Results come back in relevance order rather than newest-first. `cursor` is
      # opaque in both modes; pass back exactly what the previous response returned, and
      # start a new pagination run when the search term changes.
      sig { returns(T.nilable(String)) }
      attr_reader :search

      sig { params(search: String).void }
      attr_writer :search

      # Tag name. Repeatable: `?tag=vip&tag=chile` returns contacts carrying **every**
      # tag given, not any of them — the same rule the dashboard filter applies.
      #
      # Tags are matched by name, case-insensitively. An unknown tag returns 400 rather
      # than being ignored, because a typo that silently matched every contact would be
      # a worse answer than an error.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tag

      sig { params(tag: T::Array[String]).void }
      attr_writer :tag

      sig do
        params(
          cursor: String,
          limit: Integer,
          phone_number: String,
          search: String,
          tag: T::Array[String],
          request_options: Zavudev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Opaque cursor from a previous response's `nextCursor`. Do not construct it.
        cursor: nil,
        limit: nil,
        # Exact match on the contact's primary phone number, in E.164.
        phone_number: nil,
        # Free-text match over the contact's name (`displayName` and the WhatsApp profile
        # name), phone numbers and email addresses. Case- and accent-insensitive. A phone
        # number matches on a trailing fragment too, so `5551234` finds `+14155551234`.
        #
        # Contacts created automatically from an inbound message have no `displayName` —
        # they are matched by their identifier until you set one with
        # `PATCH /v1/contacts/{contactId}`.
        #
        # Results come back in relevance order rather than newest-first. `cursor` is
        # opaque in both modes; pass back exactly what the previous response returned, and
        # start a new pagination run when the search term changes.
        search: nil,
        # Tag name. Repeatable: `?tag=vip&tag=chile` returns contacts carrying **every**
        # tag given, not any of them — the same rule the dashboard filter applies.
        #
        # Tags are matched by name, case-insensitively. An unknown tag returns 400 rather
        # than being ignored, because a typo that silently matched every contact would be
        # a worse answer than an error.
        tag: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            cursor: String,
            limit: Integer,
            phone_number: String,
            search: String,
            tag: T::Array[String],
            request_options: Zavudev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
