require 'rspec/given'
require 'fizzbuzz'

describe "Numbers" do
  Then { to_integer(ZERO).should == 0 }
  Then { to_integer(ONE).should == 1 }
  Then { to_integer(THREE).should == 3 }
  Then { to_integer(FIVE).should == 5 }
  Then { to_integer(TEN).should == 10 }
  Then { to_integer(HUNDRED).should == 100 }
end

describe "booleans" do
  Then { to_boolean(BTRUE).should == true }
  Then { to_boolean(BFALSE).should == false }
end

describe "Not" do
  Then { to_integer(NOT.(BTRUE).(ONE).(THREE)).should == 3 }
  Then { to_integer(NOT.(BFALSE).(ONE).(THREE)).should == 1 }
end

describe "is_zero" do
  Then { to_boolean(IS_ZERO.(ZERO)).should == true }
  Then { to_boolean(IS_ZERO.(ONE)).should == false }
end

describe "Increment" do
  Then { to_integer(INC.(ZERO)).should == 1 }
  Then { to_integer(INC.(ONE)).should == 2 }
  Then { to_integer(INC.(FIVE)).should == 6 }
end

describe "Decrement" do
  Then { to_integer(DEC.(ZERO)).should == 0 }
  Then { to_integer(DEC.(ONE)).should == 0 }
  Then { to_integer(DEC.(FIVE)).should == 4 }
end

describe "addition" do
  Then { to_integer(ADD.(ZERO).(ONE)).should == 1 }
  Then { to_integer(ADD.(ONE).(ZERO)).should == 1 }
  Then { to_integer(ADD.(THREE).(ONE)).should == 4 }
  Then { to_integer(ADD.(THREE).(FIVE)).should == 8 }
end

describe "subtraction" do
  Then { to_integer(SUB.(ONE).(ZERO)).should == 1 }
  Then { to_integer(SUB.(THREE).(ONE)).should == 2 }
  Then { to_integer(SUB.(FIVE).(THREE)).should == 2 }
end

describe "multiply" do
  Then { to_integer(MUL.(FIVE).(THREE)).should == 15 }
end

describe "Less than or equal to" do
  Then { to_boolean(IS_LEQ.(ONE).(THREE)).should == true }
  Then { to_boolean(IS_LEQ.(THREE).(THREE)).should == true }
  Then { to_boolean(IS_LEQ.(THREE).(ONE)).should == false }
end

describe "Less than" do
  Then { to_boolean(IS_LT.(ONE).(THREE)).should == true }
  Then { to_boolean(IS_LT.(ONE).(ONE)).should == false }
  Then { to_boolean(IS_LT.(THREE).(ONE)).should == false }
end

describe "Y Combinator" do
  FACT_IMPROVER = ->(part) { ->(n) { n == 0 ? 1 : n * part.(n-1) } }
  FACT = Y.(FACT_IMPROVER)
  Then { FACT.(0).should == 1 }
  Then { FACT.(1).should == 1 }
  Then { FACT.(2).should == 2 }
  Then { FACT.(5).should == 120 }
end

describe "modulus" do
  TWENTY_FIVE = MUL.(FIVE).(FIVE)
  TWENTY_SEVEN = INC.(INC.(TWENTY_FIVE))
  Then { to_integer(MOD.(THREE).(FIVE)).should == 3 }
  Then { to_integer(MOD.(FIVE).(THREE)).should == 2 }
  Then { to_integer(MOD.(MUL.(FIVE).(FIVE)).(THREE)).should == 1 }
  Then { to_integer(MOD.(TWENTY_SEVEN).(THREE)).should == 0 }
end

describe "Pairs" do
  Then { to_integer(LEFT.(PAIR.(ONE).(THREE))).should == 1 }
  Then { to_integer(RIGHT.(PAIR.(ONE).(THREE))).should == 3 }
end

describe "Lists" do
  Then { to_boolean(IS_EMPTY.(EMPTY)).should == true }

  LIST1 = CONS.(ONE).(EMPTY)

  Then { to_boolean(IS_EMPTY.(LIST1)).should == false }
  Then { to_integer(HEAD.(LIST1)).should == 1 }

  Then { to_boolean(IS_EMPTY.(TAIL.(LIST1))).should == true }

  LIST2 = CONS.(THREE).(LIST1)

  Then { to_boolean(IS_EMPTY.(LIST2)).should == false }
  Then { to_integer(HEAD.(LIST2)).should == 3 }

  Then { to_boolean(IS_EMPTY.(TAIL.(LIST2))).should == false }
  Then { to_integer(HEAD.(TAIL.(LIST2))).should == 1 }

  Then { to_boolean(IS_EMPTY.(TAIL.(TAIL.(LIST2)))).should == true }

  Then { to_list(LIST2).map { |item| to_integer(item) }.should == [3, 1] }
end

describe "Ranges" do
  ERROR = -> x { fail "SHOULD NOT BE CALLED" }
  EMPTY_RANGE = RANGE_BUILDER_IMPROVER.(ERROR).(EMPTY).(ZERO)
  Then { to_boolean(IS_EMPTY.(EMPTY_RANGE)).should == true }

  Then { to_integers(RANGE_BUILDER_IMPROVER.(RANGE_BUILDER_IMPROVER.(ERROR)).(EMPTY).(ONE)).should == [1] }

  Then { to_integers(RANGE.(ZERO)).should == [] }
  Then { to_integers(RANGE.(ONE)).should == [1] }
  Then { to_integers(RANGE.(FIVE)).should == [1,2,3,4,5] }
end

describe "Fold" do
  Then { to_integer(FOLD.(RANGE.(THREE)).(ZERO).(ADD)).should == 6 }
  Then { to_integers(FOLD.(RANGE.(THREE)).(EMPTY).( -> n { -> lst { CONS.(INC.(n)).(lst) } } )).should == [2,3,4] }
end

describe "Map" do
  Then { to_integers(MAP.(RANGE.(THREE)).(INC)).should == [2, 3, 4] }
end

describe "Strings" do
  Then { to_char(ZERO).should == "0" }
  Then { to_char(DEC.(TEN)).should == "9" }
  Then { to_char(B).should == "B" }
  Then { to_char(F).should == "F" }
  Then { to_char(I).should == "i" }

  BSTRING = CONS.(B).(EMPTY)
  Then { to_string(BSTRING).should == "B" }

  Then { to_string(FIZZ).should == "Fizz" }
  Then { to_string(BUZZ).should == "Buzz" }
  Then { to_string(FIZZBUZZ).should == "FizzBuzz" }
end

describe "Division" do
  Then { to_integer(DIV.(THREE).(ONE)).should == 3 }
  Then { to_integer(DIV.(THREE).(FIVE)).should == 0 }
  Then { to_integer(DIV.(FIVE).(THREE)).should == 1 }
  Then { to_integer(DIV.(THREE).(THREE)).should == 1 }
  Then { to_integer(DIV.(TEN).(THREE)).should == 3 }
  Then { to_integer(DIV.(HUNDRED).(FIVE)).should == 20 }
end

describe "Digit Conversion" do
  Then { to_string(TO_DIGITS.(FIVE)).should == "5" }
  Then { to_string(TO_DIGITS.(TEN)).should == "10" }

  N123 = ADD.(HUNDRED).(ADD.(MUL.(INC.(ONE)).(TEN)).(THREE))
  Then { to_string(TO_DIGITS.(N123)).should == "123" }
end

describe "FizzBuzz" do
  Then { to_strings(PROGRAM.(ONE)).should == ["1"] }
  Then { to_strings(PROGRAM.(THREE)).should == ["1", "2", "Fizz"] }
  Then { to_strings(PROGRAM.(FIVE)).should == ["1", "2", "Fizz", "4", "Buzz"] }

  TWENTY = MUL.(INC.(ONE)).(TEN)
  Then { to_strings(PROGRAM.(TWENTY)).should == [
      "1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz",
      "11", "Fizz", "13", "14", "FizzBuzz", "16", "17", "Fizz", "19", "Buzz",
    ] }
end
