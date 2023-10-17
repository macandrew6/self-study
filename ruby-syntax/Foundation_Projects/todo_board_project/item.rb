class Item 
  attr_accessor :title, :description
  attr_reader :deadline
  
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
    @done = false
  end

  def toggle
    @done = !@done
  end
  
  def deadline=(new_deadline)
    raise 'You have entered an invalid deadline' if !Item.valid_date?(new_deadline)
    @deadline = new_deadline
  end
end

# item = Item.new('drive to pet store', '1988-12-20', 'clean the bird cages')
# p item.description
# item.deadline = '2022-12-20'
# p item
