# MoTables

Not production ready. Just a project that I use personally.

Inspired and heavily lifted from https://github.com/rspec-parameterized/rspec-parameterized-table_syntax


## Installation

TBI - no ruby gem. Just pull in from Github.

## Usage

Designed to be used in tests. Don't use it in production code as it overrides
the bitwise operator | and that may cause problems.

In your tests define tabular data nice and clearly using | as a delimeter.
This gets converted into an array of rows.

```
table = MoTables::Table.new(:name, :age, :industry, :active) do
  "Adam" | 45 | :tech | true
  "Dave" | 32 | :agri | false
end

table.data # =>

# [
#   {name: "Adam", age: 45, industry: :tech, active: true},
#   {name: "Dave", age: 32, industry: :agri, active: false}
# ],
```

## Why is this useful?

- Tabular data is easy to read.
- You can create records and associations using the table data
- Paremetized testing.

More details coming soon....

Coming soon.

## Development

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mo_tables.
