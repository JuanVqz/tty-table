# encoding: utf-8

module TTY
  class Table
    module Operation
      # A class responsible for wrapping text.
      #
      # @api private
      class Wrapped
        attr_reader :widths

        attr_reader :padding

        # Initialize a Wrapped
        #
        # @api public
        def initialize(widths, padding)
          @widths  = widths
          @padding = padding.padding
        end

        # Apply wrapping to a field
        #
        # @param [TTY::Table::Field] field
        #   the table field
        #
        # @param [Integer] row
        #   the field row index
        #
        # @param [Integer] col
        #   the field column index
        #
        # @return [Array[String]]
        #
        # @api public
        def call(field, row, col)
          width = widths[col] || field.width
          field.value = Verse.wrap(field.value, width, padding: padding)
        end
      end # Wrapped
    end # Operation
  end # Table
end # TTY
