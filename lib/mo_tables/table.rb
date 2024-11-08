module MoTables
  class Table
    def initialize(*headers, &block)
      @headers = headers
      @data = []
      @current_row_data = {}
      @current_header_index = 0
      evaluate_table(&block)
    end

    attr_reader :data

    def add_cell(cell_value)
      current_column = @headers[@current_header_index]
      @current_row_data[current_column.to_sym] = cell_value
      @current_header_index += 1

      reached_end_of_row = @current_header_index == @headers.size
      return unless reached_end_of_row

      @data << @current_row_data
      @current_row_data = {}
      @current_header_index = 0
    end

    def each(&block)
      @data.each { block.call(_1) }
    end

    def one_column_remaining_in_row?
      @current_header_index == @headers.size - 1
    end

    private

    def evaluate_table
      yield
    end
  end
end
