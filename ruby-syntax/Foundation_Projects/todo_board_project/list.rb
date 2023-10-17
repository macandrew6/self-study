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
    if valid_index?(index_1) && valid_index?(index_2)
      @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
      true
    else
      false
    end
  end

  def [](index)
    if valid_index?(index)
      @items[index]
    else
      nil
    end
  end

  def priority
    @items[0]
  end
end

list = List.new('Chores')
p list.add_item('watch black bird1', '2023-12-03', 'description')
p list.add_item('watch black bird2', '2022-06-03', 'description')
p list.add_item('watch black bird3', '2021-08-03', 'description')
p list.add_item('watch black bird4', '2020-11-06', 'description')
p list.add_item('watch black bird5', '2020-12-06', 'description')
p list.swap(-1, 3)
p list.priority