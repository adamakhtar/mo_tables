module MoTables::SyntaticSugar
  # I don't normally like writing comments but this is esoteric Ruby so here
  # we are.
  #
  # Override the bitwise | operator to enable syntactic sugar for defining table rows.
  #
  # This allows defining rows inline when initializing a Table:
  #
  #   table = Table.new(:name, :age, :job) do
  #     "Adam" | 45 | :programmer
  #     "Dave" | 30 | :youtuber
  #   end
  #
  # By overriding |, we can use it in place of commas or other separators for row entries,
  # so that expressions like `1 | 2 | 3` represent cells in a row.
  #
  # Ruby allows operators like +, -, *, and | to be called without a dot, enhancing readability.
  # With this override, expressions like `1 | 2 | 3` will invoke `1.|(2)` followed by `2.|(3)`.
  # Using refinements here ensures that this override only applies within the context this Module
  # is included i.e. it wont leak into other tests or production code.
  #
  # Each call to | adds the caller (e.g., 1) as a cell to the table, returning `other`
  # to continue the chain. For the last cell (e.g., 3), we add it directly, as `|` won't be called.
  def |(other)
    # This method is being called inside a block called by a Table instance.
    # Get the table instance from the block’s binding.
    binding_of_table_block = binding.of_caller(2)
    table_instance = eval("self", binding_of_table_block, __FILE__, __LINE__)

    # Add the caller as a cell in the current row.
    table_instance.add_cell(self)

    # If this is the second-last cell, also add `other` to complete the row.
    table_instance.add_cell(other) if table_instance.one_column_remaining_in_row?
    other
  end
end
