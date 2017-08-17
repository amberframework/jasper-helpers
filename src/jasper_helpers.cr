require "./jasper_helpers/*"

module JasperHelpers
  alias OptionHash = Hash(Symbol, String | Symbol | Bool | Int32 | Float64 | Nil)

  include Tags
  include Forms
  include Links
end
