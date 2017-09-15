require "./jasper_helpers/*"

module JasperHelpers
  alias OptionHash = Hash(Symbol, Nil | String | Symbol | Bool | Int32 | Int64 | Float32 | Float64 | Time | Bytes)

  include Tags
  include Forms
  include Links
end
