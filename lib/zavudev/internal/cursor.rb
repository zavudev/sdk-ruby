# frozen_string_literal: true

module Zavudev
  module Internal
    # @generic Elem
    #
    # @example
    #   if cursor.has_next?
    #     cursor = cursor.next_page
    #   end
    #
    # @example
    #   cursor.auto_paging_each do |message|
    #     puts(message)
    #   end
    class Cursor
      include Zavudev::Internal::Type::BasePage

      # @return [Array<generic<Elem>>, nil]
      attr_accessor :items

      # @return [String]
      attr_accessor :next_cursor

      # @return [Boolean]
      def next_page?
        !items.to_a.empty? && !next_cursor.to_s.empty?
      end

      # @raise [Zavudev::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = Zavudev::Internal::Util.deep_merge(@req, {query: {cursor: next_cursor}})
        @client.request(req)
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.items&.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [Zavudev::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        case page_data
        in {items: Array => items}
          @items = items.map { Zavudev::Internal::Type::Converter.coerce(@model, _1) }
        else
        end
        @next_cursor = page_data[:nextCursor]
      end

      # @api private
      #
      # @return [String]
      def inspect
        model = Zavudev::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)} next_cursor=#{next_cursor.inspect}>"
      end
    end
  end
end
