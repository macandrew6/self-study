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

  def size
    @items.count
  end

  def valid_index?(index)
    index < @items.length && index >= 0
  end

  def swap(index_1, index_2)
    @items[index_1], @items[index_2] = @items[index_2], @index[index_1]
  end
end

list = List.new('Chores')
p list.add_item('watch black bird', '2023-12-03', 'description')
p list.add_item('watch black bird', '2022-06-03', 'description')
p list.add_item('watch black bird', '2021-08-03', 'description')
p list.add_item('watch black bird', '2020-11-06', 'description')
p list.add_item('watch black bird', '2020-12-06', 'description')
p list