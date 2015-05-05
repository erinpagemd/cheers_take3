require_relative '../test_helper'

class TestCheers < Minitest::Test

  def test_the_test
    assert false
  end

  def test_happy_path
    shell_output = ""
    expected = []
    IO.popen('./cheers', 'r+') do |pipe|
      expected << "Hello, what's your name?\n"
      pipe.puts "Ed"
      expected << "Give me an.. E!\n"
      expected << "Give me a... D!\n"
      expected << "Ed's just GRAND!\n"
      expected << "Hey Ed, what's your birthday? (mm/dd)"
      pipe.puts "05/06"
      expected << "Awesome! Your birthday is in 1 day! Happy Birthday in advance!\n"
      pipe.close_write
      shell_output = pipe.read
    end
      assert_equal expected, shell_output
  end

  def test_wrong_input
    shell_output = ""
    expected = []
    IO.popen('./cheers', 'r+') do |pipe|
      expected << "Hello, what's your name?\n"
      pipe.puts "Ed"
      expected << "Give me an.. E!\n"
      expected << "Give me a... D!\n"
      expected << "Ed's just GRAND!\n"
      expected << "Hey Ed, what's your birthday? (mm/dd)"
      pipe.puts "25/08"
      expected << "I do not recognize that format. Better luck next time.\n"
      pipe.close_write
      shell_output = pipe.read
    end
      assert_equal expected, shell_output
  end

  def test_no_input
    shell_output = ""
    expected = []
    IO.popen('./cheers', 'r+') do |pipe|
      expected << "Hello, what's your name?\n"
      pipe.puts ""
      expected << "I do not recognize that format. Better luck next time.\n"
      pipe.close_write
      shell_output = pipe.read
    end
      assert_equal expected, shell_output
  end


  def test_bad_birthday_format
  end

end
