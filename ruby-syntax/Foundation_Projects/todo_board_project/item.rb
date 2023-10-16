class Item 
  def self.valid_date?(date_string)
    year, month, day = date_string.split('-')
    valid_years = ("1900".."3000").to_a
    valid_months = ("01".."12").to_a
    valid_days = ("01".."31").to_a

    valid_years.include?(year) && valid_months.include?(month) && valid_days.include?(day)
  end

  def initialize(title, deadline, description)
    raise 'You have entered an invalid deadline' if !Item.valid_date?(deadline)
    @title = title
    @deadline = deadline
    @description = description
  end
end

item = Item.new('drive to pet store', '1352-12-20', 'clean the bird cages')
p item
