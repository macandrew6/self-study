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

  def print
    p Array.new(50){"-"}.join
    p Array.new(22){"-"}.join + "#{self.label}" + Array.new(22){"-"}.join
    p Array.new(50){"-"}.join
    p "Index   | Item                        | Deadline  "
    p Array.new(50){"-"}.join

    @items.each_with_index do |item, i|
      p "#{i.to_s.ljust(7)} | #{item.title.ljust(27)} | #{item.deadline}"
    end

    p Array.new(50){"-"}.join
  end

  def print_full_item(index)
    if valid_index?(index)
      item = @items[index]
      p ("-").ljust(50, "-")
      p "#{item.title.ljust(36)}  | #{item.deadline}"
      p "#{item.description.ljust(50)}"
      p ("-").ljust(50, "-")
    end
  end

  def print_priority
    print_full_item(0)
  end

  def up(index, amt = 1)
    if valid_index?(index)
      amt.times do 
        swap(index, index - 1)
        index -= 1
        true
      end
    else
      false
    end
  end

  def down(index, amt = 1)
    if valid_index?(index)
      amt.times do 
        p "#{index} im running"
        swap(index, index + 1)
        index += 1
        true
      end
    else
      false
    end
  end

  def sort_by_date!
    @items.sort_by! {|item| item.deadline}.reverse!
  end
end

# list = List.new('Chores')
# p list.add_item('watch black bird1', '2023-12-03', 'description')
# p list.add_item('watch black bird2', '2022-06-03', 'description')
# p list.add_item('watch black bird3', '2021-08-03', 'description')
# p list.add_item('watch black bird4', '2020-11-06', 'description')
# p list.add_item('watch black bird5', '2020-12-06', 'description')
# list.down(0, 12)
# # list.up(4,2)

# list.sort_by_date!
# list.print
# list.print_priority
