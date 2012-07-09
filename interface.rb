######################################################################
# Lambda-Calculus to Ruby Interface Methods
######################################################################

def to_integer(lex)
  lex.(->(n) { n + 1 }).(0)
end

def to_boolean(lex)
  lex.(true).(false)
end

def pair_left(pair)
  pair.(->(a) { ->(b) { a } } )
end

def pair_right(pair)
  pair.(->(a) { ->(b) { b } } )
end

def list_empty?(lst)
  to_boolean(pair_left(lst))
end

def list_head(lst)
  pair_left(pair_right(lst))
end

def list_tail(lst)
  pair_right(pair_right(lst))
end

def to_list(lst)
  result = []
  while ! list_empty?(lst)
    result << list_head(lst)
    lst = list_tail(lst)
  end
  return result
end

def to_integers(lst)
  to_list(lst).map { |x| to_integer(x) }
end

def to_char(n)
  "0123456789BFiuz"[to_integer(n)]
end

def to_string(s)
  to_list(s).map { |c| to_char(c) }.join
end

def to_strings(lst)
  to_list(lst).map { |x| to_string(x) }
end


