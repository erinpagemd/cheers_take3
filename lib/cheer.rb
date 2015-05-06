class Cheer

  AN_LETTERS = "HALFNORSEMIX"

  def self.for_birthday(birthday)
   today = Date.today
   next_birthday = BirthdayParser.parse(birthday)
   difference = next_birthday - today
   case difference
   when 0
     # Today is their birthday
   when 1
     #Use the singular?
   else
     #Use the plural?
   end
 end

  def self.for_person(name)
    name = name.to_s
    valid_name?(name)
    name_gsub = name.gsub(/[\W\d]/, "")
    message = ""
    name_gsub.each_char do |c|
      if AN_LETTERS.include?(c.upcase)
        message << "Give me an.. #{c.upcase}!\n"
      else
        message << "Give me a... #{c.upcase}!\n"
      end
    end
    message << "#{name}'s just GRAND!\n"
  end

  def self.valid_name?(name)
    maybe_name = name.to_s
    maybe_name_gsub = maybe_name.gsub(/[\W\d]/, "")
    raise ArgumentError if maybe_name_gsub.empty? || maybe_name.empty? || maybe_name.nil?
  end
end
