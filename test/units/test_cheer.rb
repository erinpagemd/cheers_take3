require_relative '../test_helper'
require_relative '../../lib/cheer'

class TestCheer < Minitest::Test

  def test_happy_path_name
    actual = Cheer.for_person("Ed")
    expected = "Give me an.. E!\n" +
               "Give me a... D!\n" +
               "Ed's just GRAND!\n"
    assert_equal expected, actual
  end

  def test_happy_path_other_name
    actual = Cheer.for_person("Abby")
    expected = "Give me an.. A!\n" +
               "Give me a... B!\n" +
               "Give me a... B!\n" +
               "Give me a... Y!\n" +
               "Abby's just GRAND!\n"
    assert_equal expected, actual
  end

  def test_hyphenated_name
    actual = Cheer.for_person("Billy-Ray")
    expected = "Give me a... B!\n" +
               "Give me an.. I!\n" +
               "Give me an.. L!\n" +
               "Give me an.. L!\n" +
               "Give me a... Y!\n" +
               "Give me an.. R!\n" +
               "Give me an.. A!\n" +
               "Give me a... Y!\n" +
               "Billy-Ray's just GRAND!\n"
    assert_equal expected, actual
  end

  def test_name_with_space
    actual = Cheer.for_person("Mary Jane")
    expected = "Give me an.. M!\n" +
               "Give me an.. A!\n" +
               "Give me an.. R!\n" +
               "Give me a... Y!\n" +
               "Give me a... J!\n" +
               "Give me an.. A!\n" +
               "Give me an.. N!\n" +
               "Give me an.. E!\n" +
               "Mary Jane's just GRAND!\n"
    assert_equal expected, actual
  end

  def test_all_an_letters
    actual = Cheer.for_person("AEFHILMNORSX")
    expected = "Give me an.. A!\n" +
               "Give me an.. E!\n" +
               "Give me an.. F!\n" +
               "Give me an.. H!\n" +
               "Give me an.. I!\n" +
               "Give me an.. L!\n" +
               "Give me an.. M!\n" +
               "Give me an.. N!\n" +
               "Give me an.. O!\n" +
               "Give me an.. R!\n" +
               "Give me an.. S!\n" +
               "Give me an.. X!\n" +
               "AEFHILMNORSX's just GRAND!\n"
    assert_equal expected, actual
  end

  def test_birthday_instead_of_name
    assert_raises(ArgumentError) do
      Cheer.for_person("05/29")
    end
  end

  def test_all_nonword_chars_name
    assert_raises(ArgumentError) do
      Cheer.for_person("&!?")
    end
  end

  def test_empty_string_name
    assert_raises(ArgumentError) do
      Cheer.for_person("")
    end
  end

  def test_whitespace_name
    assert_raises(ArgumentError) do
      Cheer.for_person(" ")
    end
  end

end
