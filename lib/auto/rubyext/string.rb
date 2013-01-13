# This changes the String class in Ruby's standard library to make life easier
# by aliasing String#uc to String#upcase and String#dc to String#downcase
class String
  alias_method :uc, :upcase
  alias_method :dc, :downcase
  alias_method :uc!, :upcase!
  alias_method :dc!, :downcase!
end

# vim: set ts=4 sts=2 sw=2 et:
