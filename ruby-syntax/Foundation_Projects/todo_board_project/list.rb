require './item'

class List
  attr_accessor :label
  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description='')
    if Item.valid_date?(deadline)
      @items << Item.new(title, deadline, description)
      true
    else
      false
    end
  end
end

list = List.new('Chores')
p list.add_item('watch black bird', '2023-12-03', 'description')
p list.add_item('watch black bird', '2023-13-03', 'description')
p list