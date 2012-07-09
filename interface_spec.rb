require 'rspec/given'
require 'interface'

describe "Lambda Calculus Interface Functions" do
  module L
    ZERO  = ->(f) { ->(v) {                v      } }
    ONE   = ->(f) { ->(v) {             f.(v)     } }
    TWO   = ->(f) { ->(v) {          f.(f.(v))    } }
    TEN   = ->(f) { ->(v) {  f.(f.(f.(f.(f.(f.(f.(f.(f.(f.(v))))))))))    } }

    BTRUE  = ->(a) { ->(b) { a } }
    BFALSE = ->(a) { ->(b) { b } }
    PAIR  = ->(l) { ->(r){ ->(f) { f.(l).(r) } } }
    LEFT  = ->(p) { p.(->(l) { ->(r) { l } } ) }
    RIGHT = ->(p) { p.(->(l) { ->(r) { r } } ) }

    A_PAIR = PAIR.(ONE).(TWO)


    EMPTY = PAIR.(BTRUE).(BTRUE)
    IS_EMPTY = LEFT

    CONS = ->(item) { ->(lst) { PAIR.(BFALSE).(PAIR.(item).(lst)) } }
    HEAD = ->(lst) { LEFT.(RIGHT.(lst)) }
    TAIL = ->(lst) { RIGHT.(RIGHT.(lst)) }

    A_LIST = CONS.(ONE).(EMPTY)

    B2 = CONS.(TEN).(CONS.(TWO).(EMPTY))

    STRINGS = CONS.(B2).(EMPTY)
  end

  describe "#to_integer" do
    Then { to_integer(L::ZERO).should == 0 }
    Then { to_integer(L::ONE).should == 1 }
    Then { to_integer(L::TWO).should == 2 }
  end

  describe "#to_boolean" do
    Then { to_boolean(L::BTRUE).should == true }
    Then { to_boolean(L::BFALSE).should == false }
  end


  describe "Pair accessors" do
    Then { to_integer(pair_left(L::A_PAIR)).should == 1 }
    Then { to_integer(pair_right(L::A_PAIR)).should == 2 }
  end
  describe "#list_empty" do
    Then { list_empty?(L::EMPTY).should == true }
    Then { list_empty?(L::A_LIST).should == false }
  end

  describe "list accessors" do
    Then { to_integer(list_head(L::A_LIST)).should == 1 }
    Then { list_empty?(list_tail(L::A_LIST)).should == true }
  end

  describe "#to_list" do
    Given(:array) { to_list(L::A_LIST) }
    Then { to_integer(array.first).should == 1 }
    Then { array.size.should == 1 }
  end

  describe "#to_integers" do
    Then { to_integers(L::A_LIST).should == [1] }
  end

  describe "#to_char" do
    Then { to_char(L::ONE).should == "1" }
    Then { to_char(L::TEN).should == "B" }
  end

  describe "#to_string" do
    Then { to_string(L::B2).should == "B2" }
  end

  describe "#to_strings" do
    Then { to_strings(L::STRINGS).should == ["B2"] }
  end
end
