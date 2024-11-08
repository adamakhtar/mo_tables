require "test_helper"

using MoTables

describe "Table" do
  it "evaluates the table syntax and stores it as an array of rows each as a hash of header name and cell value pairs" do
    table = MoTables::Table.new(:name, :age, :industry, :active) do
      "Adam" | 45 | :tech | true
      "Dave" | 32 | :agri | false
    end

    assert_equal(
      [
        {name: "Adam", age: 45, industry: :tech, active: true},
        {name: "Dave", age: 32, industry: :agri, active: false}
      ],
      table.data
    )
  end

  describe "#each" do
    it "it yields each row and allows for extra data to be added to each row" do
      table = MoTables::Table.new(:a, :b, :expected) do
        1 | 2 | 3
        5 | 4 | 9
      end

      table.each do |row|
        row[:total] = row[:a] + row[:b]
      end

      table.each do |row|
        assert_equal row[:expected], row[:total]
      end
    end
  end
end
