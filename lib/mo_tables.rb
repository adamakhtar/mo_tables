# frozen_string_literal: true

require "binding_of_caller"
require_relative "mo_tables/version"
require_relative "mo_tables/syntatic_sugar"
require_relative "mo_tables/table"

module MoTables
  refine Object do
    import_methods MoTables::SyntaticSugar
  end

  refine Integer do
    import_methods MoTables::SyntaticSugar
  end

  refine Array do
    import_methods MoTables::SyntaticSugar
  end

  refine NilClass do
    import_methods MoTables::SyntaticSugar
  end

  refine TrueClass do
    import_methods MoTables::SyntaticSugar
  end

  refine FalseClass do
    import_methods MoTables::SyntaticSugar
  end
end
