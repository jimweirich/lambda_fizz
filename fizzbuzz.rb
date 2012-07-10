######################################################################
### FizzBuzz in Lambda-Calculus
######################################################################

# This file is inspired by Tom Stuart's "Programming with Nothing"
# article
# ("http://experthuman.com/programming-with-nothing":http://experthuman.com/programming-with-nothing).
# Most of the code is taken directly from there, although I do vary
# from it in a few places.
#
## Files of Interest:
#
# * "fizzbuzz.rb":https://github.com/jimweirich/lambda_fizz/blob/master/fizzbuzz.rb -- The original code file that generated this readme.
#
# * "cfb.rb":https://github.com/jimweirich/lambda_fizz/blob/master/cfb.rb -- The "compiled" version of the fizzbuzz program, with all the constants expanded inline.
#
# * "cfb2.rb":https://github.com/jimweirich/lambda_fizz/blob/master/cfb2.rb -- Same as cfb.rb, but with the code nicely formatted and indented.
#
# * "interface.rb":https://github.com/jimweirich/lambda_fizz/blob/master/interface.rb -- The full Ruby interface functions used to translate the lambda calculus data structures to something that is human readable.
#
## The Rules:
#
# We are only allowed to write procs and to call procs.  No other Ruby
# operation is allowed in the main program.
#
# That's it!  No numbers, strings, methods, classes, mixins,
# operators, or any other Ruby construct other than creating procs and
# calling procs.
#
# We do relax that rule to allow defining constants.  This allows us
# to name useful fragments of code.  Since strict replacement is the
# key, we don't allow any self-reference (this become important when
# dealing with recursive functions).
#
# Although the main program is completely written using nothing but lambda
# expressions, we do allow some standard Ruby helper functions to
# translate from the lambda calculus representations to something human
# readable.  You will find the helper functions in the interface.rb
# file.

######################################################################
## Numbers

# We will start with some Church numerals.  A Church numeral is a
# function that takes a function @f@ and a value @v@, and applies @f@
# to @v@ the appropriate number of times.  For example, @ONE@ applies
# @f@ once. @THREE@ applies @f@ 3 times.  And @ZERO@ applies @f@ zero
# times.

ZERO  = ->(f) { ->(v) {                v      } }
ONE   = ->(f) { ->(v) {             f.(v)     } }
THREE = ->(f) { ->(v) {       f.(f.(f.(v)))   } }
FIVE  = ->(f) { ->(v) { f.(f.(f.(f.(f.(v))))) } }

TEN   = ->(f) { ->(v) { f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v)))))))))) } }

FIFTEEN   = ->(f) { ->(v) { f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))))))) } }

HUNDRED = ->(f) {
  ->(v) {
    f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(
    f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(
    f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(
    f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(
    f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(
    f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(
    f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(
    f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(
    f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(
    f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(
     v
    ))))))))))
    ))))))))))
    ))))))))))
    ))))))))))
    ))))))))))
    ))))))))))
    ))))))))))
    ))))))))))
    ))))))))))
    ))))))))))
  }
}

######################################################################
## Boolean Values and Functions

# Boolean values are functions that take two arguments and return one
# of them. True returns the first argument and false returns the
# second.

BTRUE  = ->(a) { ->(b) { a } }
BFALSE = ->(a) { ->(b) { b } }

# Side note about multiple arguments.  We could write functions that
# take two arguments like this:
#
#     BTRUE = ->(a, b) { a }
#
# But it turns out that it is convenient to represent functions of
# multiple arguments as nested functions, so we will write all of our
# functions in this manner.  So a boolean function (@BTRUE@ or
# @BFALSE@) written in this manner will be called like this:
#
#     bool.(TRUE_VALUE).(FALSE_VALUE)

# The logical not operation is interesting.  It is a function that
# takes a boolean, and returns the opposite value of the boolean as a
# result.

NOT = ->(bool) { bool.(BFALSE).(BTRUE) }

# Is a number zero?  Give the number a function that always returns
# false, and feed it an initial value of true.  If the number is zero,
# then the initial value (true) is returned.  If the number is
# anything else, then then false (from the supplied function) will be
# returned.

IS_ZERO = ->(n) { n.(->(x) { BFALSE }).(BTRUE) }

# An interesting result of defining boolean values as functions is
# that we don't need an explicit if statement.  If I want to test
# number @n@' for being zero and return @ONE@ if it is zero and
# @THREE@ if is not, it would be written like this:
#
#     IS_ZERO.(n).(ONE).(THREE)

######################################################################
## Pairs

# The pair is going to be our basic construct for building data
# structures.  The pair constructure takes two values (a right side
# value and a left side value) and returns a closure that binds the
# two values together.
#
#     P = PAIR.(ONE).(THREE)  # returns a pair containing 1 and 3
#
# Here's the definition of @PAIR@:

PAIR  = ->(left) { ->(right){ ->(f) { f.(left).(right) } } }

# To extract the paired values, call the pair function with a function
# that takes the left and right values as arguments and returns the
# one you need.  For example, given @P@ above, @LEFT@ and @RIGHT@
# works like this:
#
#    LEFT.(P)   # returns ONE
#    RIGHT.(P)  # returns THREE
#
# Here's the defintions of @LEFT@ and @RIGHT@:

LEFT  = ->(p) { p.(->(left) { ->(right) { left } } ) }
RIGHT = ->(p) { p.(->(left) { ->(right) { right } } ) }

######################################################################
## Math Functions

# To increment a number, we just return a number-like function (one
# taking a function argument and a value) and arrange to have the
# given function called one more time that the number.

INC = ->(n) { ->(f) { ->(v) { f.(n.(f).(v)) } } }

# Decrementing turns out to be quite a bit more difficult than
# incrementing. Tom Stuart uses a decrementing function that he
# doesn't explain (and I can't quite figure it out). I'm using a
# different technique that seems pretty straight forward to me.

# It helps to think of decrementing as finding the predecessor of a
# given number. Imagine you have a pair of numbers (n, n-1), where n-1
# is the predecessor of n.  The @PHI@ function takes this pair of
# numbers and returns a new pair that contains (n+1, n).

PHI = ->(pair){
  PAIR.(INC.(LEFT.(pair))).(LEFT.(pair))
}

# So, to implement decrement, all we need to do is start with the pair
# (0, 0) and apply @PHI@ n times, yielding (n, n-1).  We then just
# choose the right hand side of the resulting pair to get the
# predecessor of n.  Notice that this definition of @DEC@ will yield 0
# as the predecessor of 0.  A strange result, but one we will use to
# advantage later.

DEC = ->(n) { RIGHT.(n.(PHI).(PAIR.(ZERO).(ZERO))) }

# Now that we can increment and decrement, writing some basic math
# functions is pretty straight forward.

ADD = ->(a) { ->(b) { a.(INC).(b) } }
SUB = ->(a) { ->(b) { b.(DEC).(a) } }
MUL = ->(a) { ->(b) { a.(ADD.(b)).(ZERO) } }

######################################################################
## Numeric Comparisons

# To tell if @a@ is less than or equal to @b@, subtract @b@ from @a@
# @(a-b)@, and if the result is less than or equal to zero, then @a <=
# b@.  Since our number representation does not handle negative
# numbers, we have a weird case where @a-b@ is 0 if @b@ is larger than
# @a@.  This works out for us because then all we need to do is test
# for zero.

IS_LEQ = ->(a) { ->(b) { IS_ZERO.(SUB.(a).(b)) } }

# I actually want to use "@<@" in the next function.  We can derive
# the less than function from "@<=@" by reversing the arguments and
# applying a logical @NOT@.

IS_LT = ->(a) { ->(b) { NOT.(IS_LEQ.(b).(a)) } }

######################################################################
## Modulus (and recursive functions)

# If we were to write a modulus function in straight Ruby, it might
# look something like this
#
#     def mod(a,b)
#       a<b ? a : mod(a-b,b)
#     end
#
# There are two problems with translating this definition to our
# rather limited lambda-calculus.  First, mod as defined above is
# recursive, calling itself by name from within its own body. Our rule
# about no self-references means that we can't write @MOD@ as a
# straight translation of the above code.
#
# No worries.  We will use the Y-Combinator to construct our recursive
# definition.  Here's the Applicative Order version of the
# Y-Combinator (also called the Z-Combinator).

Y = ->(f) {
  ->(g) { ->(n) { f.(g.(g)).(n) } }.(
  ->(g) { ->(n) { f.(g.(g)).(n) } } )
}

# To create a recursive function using @Y@, we need to define what I
# call an improver function.  An improver function takes a partial
# function defintion and improves it just a little bit.
#
# Here's the improver function for modulus:

MOD_IMPROVER = ->(partial) {
  ->(a) {
    ->(b) {
      IS_LT.(a).(b).
      ( a ).
      ( ->(x) { partial.(SUB.(a).(b)).(b).(x) } )
    }
  }
}

# Suppose you have a partial definition of modulus that only works for
# cases where @a@ is less than @b@.  If you feed that function into
# the improver, you will get a function that works for @a < 2*b@.
# Feed that back into the improver and you get a modulus function that
# works for @a < 3*b@.  Each new version is slightly better than the
# next.  The Y-Combinator takes the improver and turns it into the
# full version of modulus.

MOD = Y.(MOD_IMPROVER)

# Let's talk about the @->(x) { }@ function that wraps the call to
# partial in the definition of @MOD@.  Since arguments are always
# evaluated before passed to functions, attempting to pass the partial
# call directly will result in infinte recursion and stack overflow.
# By wrapping it in a function, we pass a function instead. The
# function is called and the partial invoked only when needed.

######################################################################
## Lists
#
# We use pairs to build lists of arbitrary length.  Two pairs are used
# to hold a single element of the list.  The pairs are
#
#     pair 1
#       left => false (flag indicating not the end of the list)
#       right => pair 2
#     pair 2
#       left => element
#       right => rest of the list
#
# So the empty list is a single pair where the left value is true
# (ie. end of list)

EMPTY = PAIR.(BTRUE).(BTRUE)
IS_EMPTY = LEFT

# @CONS@ adds an item to the begining of a list.

CONS = ->(item) { ->(lst) { PAIR.(BFALSE).(PAIR.(item).(lst)) } }

# @HEAD@ returns the first item of a list.  @TAIL@ returns a list of
# all the remaining elements after the first.

HEAD = ->(lst) { LEFT.(RIGHT.(lst)) }
TAIL = ->(lst) { RIGHT.(RIGHT.(lst)) }

######################################################################
## Ranges
#
# We need an easy way to generate a list of numbers up to a maximum.
# @RANGE.(n)@ will return a list from 1 to @n@.

RANGE_BUILDER_IMPROVER = ->(partial) {
  ->(lst) {
    ->(n) {
      IS_ZERO.(n).(lst).( ->(x) { partial.(CONS.(n).(lst)).(DEC.(n)).(x) } )
    }
  }
}
RANGE = Y.(RANGE_BUILDER_IMPROVER).(EMPTY)

######################################################################
## Fold and Map
#
# In Ruby, we use each to build all the enumerable methods.  Here we
# will do the same, but starting with @FOLD@.  @FOLD@ is similar to
# Ruby's reduce.  It is called like this:
#
#     FOLD.(list).(initial).(f)
#
# Where @f@ is a function of two arguments called like this:
#
#     f.(item).(previous_value)
#
# The function @f@ will be called agains each item in the list. The
# second argument to f is the value of the previous call to f. The
# first time f is called, the initial value will be passed in for the
# previous value.

FOLD_IMPROVER = ->(partial) {
  ->(lst) {
    ->(initial) {
      ->(f) {
        IS_EMPTY.(lst).
        (initial).
        ( ->(x) { f.(HEAD.(lst)).(partial.(TAIL.(lst)).(initial).(f)).(x) } )
      }
    }
  }
}
FOLD = Y.(FOLD_IMPROVER)

# We will build map from fold by using a function that conses
# @f(item)@ onto the previous return value.  By initializing with the
# empty list, the result will be a list of @f@ applied to each item.

MAP = ->(lst) { ->(f) { FOLD.(lst).(EMPTY).( ->(item) { ->(lst) { CONS.(f.(item)).(lst) } } ) } }

######################################################################
## Character Encodings and Strings
#
# We can choose any character encoding we find convenient. Since we
# only need the 10 digits and the letters 'B', 'F', 'i' 'u' and 'z',
# we choose to let the numbers < 10 represent themselves and numbers
# over 10 to represent the handful of letters we need. (This is the
# same encoding that Tom Stuart used.)
#
# Note that the @to_char@ and @to_string@ helper functions in
# 'interface.rb' are sensitive to this choice of encoding.

B = TEN
F = INC.(B)
I = INC.(F)
U = INC.(I)
Z = INC.(U)

# Strings are just lists of characters. We need "Fizz", "Buzz" and
# "FizzBuzz".

FIZZ = CONS.(F).(CONS.(I).(CONS.(Z).(CONS.(Z).(EMPTY))))
BUZZ = CONS.(B).(CONS.(U).(CONS.(Z).(CONS.(Z).(EMPTY))))
FIZZBUZZ = CONS.(F).(CONS.(I).(CONS.(Z).(CONS.(Z).(BUZZ))))

######################################################################
## Division
#
# A recursive definition for division. Keep subtracting the
# denominator from the numerator until the numerator is less than the
# numerator, then just return the number of times the subtraction was
# done.

DIV_IMPROVER = ->(partial) {
  ->(num) {
    ->(denom){
      IS_LT.(num).(denom).
      (ZERO).
      ( ->(x) { INC.(partial.(SUB.(num).(denom)).(denom)).(x) } )
    }
  }
}
DIV = Y.(DIV_IMPROVER)

######################################################################
## Converting numbers to strings
#
# This is a standard number to string conversion method. The digits
# are calculated starting with the least significant digit of the
# result @(n % 10)@.  To prevent the digits from being built in
# reverse order, we use a trick where we pass the "result so far" as
# an argument.  When the number is finished converting @(n<10)@, we
# just return the cons of @n@ on the "result so far".  Initializing
# the "result so far" with an empty list completes the trick.
#
# Tom points out that choosing an encoding where a number < 10 is its
# own character encoding greatly simplifies the overall conversion,
# and I certainly agree.

TO_DIGITS_IMPROVER = ->(partial) {
  ->(result) {
    ->(n) {
      IS_LT.(n).(TEN).
      (CONS.(n).(result)).
      ( ->(x) { partial.(CONS.(MOD.(n).(TEN)).(result)).(DIV.(n).(TEN)).(x) } )
    }
  }
}
TO_DIGITS = Y.(TO_DIGITS_IMPROVER).(EMPTY)

######################################################################
## The FizzBuzz Main Program
#
# We now have everything in place to create the FizzBuzz program.  The
# program will create a list of FizzBuzz numbers (as strings) from 1
# up to @limit@.  We use @RANGE@ to create the initial list of numbers
# and then @MAP@ to walk the list and transform it into either "Fizz",
# "Buzz", "FizzBuzz", or the string representation of the number.

PROGRAM = ->(limit){
  MAP.(RANGE.(limit)).(
    ->(n) {
      IS_ZERO.(MOD.(n).(FIFTEEN)).(
        FIZZBUZZ
      ).(
      IS_ZERO.(MOD.(n).(THREE)).(
        FIZZ
      ).(
      IS_ZERO.(MOD.(n).(FIVE)).(
        BUZZ
      ).(
        TO_DIGITS.(n)
      )))
    }
    )
}

######################################################################
## Kick-start the FizzBuzz program and print its results.
#
# Finally we run the program and collect the result in @RESULT@.  We
# then use the full Ruby-based interface functions to transcribe our
# calculated result to something humans can read.

if $0 == __FILE__
  RESULT = PROGRAM.(HUNDRED)

  require "interface"
  puts to_strings(RESULT)
end
