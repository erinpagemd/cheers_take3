class BirthdayParser

  def self.valid_date?(birthday)
    maybe_date = birthday
    maybe_month = maybe_date[0..1].gsub(/[\D]/, "").to_i
    begin
      Date.parse(birthday)
    rescue
      return false
    end
    true if maybe_date.size < 7 && maybe_month <= 12 && maybe_month != 0
  end

  def self.parse(birthday)
    Date.parse(birthday) if valid_date?(birthday)
  end
end
