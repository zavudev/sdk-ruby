# frozen_string_literal: true

module Zavudev
  module Models
    # @see Zavudev::Resources::Contacts#list
    class ContactListParams < Zavudev::Internal::Type::BaseModel
      extend Zavudev::Internal::Type::RequestParameters::Converter
      include Zavudev::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Opaque cursor from a previous response's `nextCursor`. Do not construct it.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute phone_number
      #   Exact match on the contact's primary phone number, in E.164.
      #
      #   @return [String, nil]
      optional :phone_number, String

      # @!attribute search
      #   Free-text match over the contact's name (`displayName` and the WhatsApp profile
      #   name), phone numbers and email addresses. Case- and accent-insensitive. A phone
      #   number matches on a trailing fragment too, so `5551234` finds `+14155551234`.
      #
      #   Contacts created automatically from an inbound message have no `displayName` —
      #   they are matched by their identifier until you set one with
      #   `PATCH /v1/contacts/{contactId}`.
      #
      #   Results come back in relevance order rather than newest-first. `cursor` is
      #   opaque in both modes; pass back exactly what the previous response returned, and
      #   start a new pagination run when the search term changes.
      #
      #   @return [String, nil]
      optional :search, String

      # @!attribute tag
      #   Tag name. Repeatable: `?tag=vip&tag=chile` returns contacts carrying **every**
      #   tag given, not any of them — the same rule the dashboard filter applies.
      #
      #   Tags are matched by name, case-insensitively. An unknown tag returns 400 rather
      #   than being ignored, because a typo that silently matched every contact would be
      #   a worse answer than an error.
      #
      #   @return [Array<String>, nil]
      optional :tag, Zavudev::Internal::Type::ArrayOf[String]

      # @!method initialize(cursor: nil, limit: nil, phone_number: nil, search: nil, tag: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Zavudev::Models::ContactListParams} for more details.
      #
      #   @param cursor [String] Opaque cursor from a previous response's `nextCursor`. Do not construct it.
      #
      #   @param limit [Integer]
      #
      #   @param phone_number [String] Exact match on the contact's primary phone number, in E.164.
      #
      #   @param search [String] Free-text match over the contact's name (`displayName` and the WhatsApp profile
      #
      #   @param tag [Array<String>] Tag name. Repeatable: `?tag=vip&tag=chile` returns contacts carrying **every** t
      #
      #   @param request_options [Zavudev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
