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

  def toggle_item(index)
    @items[index].toggle
  end

  def remove_item(index)
    if valid_index?(index)
      @items = @items[0...index] + @items[index+1..-1]
      true
    else
      false
    end
  end

  def purge
    @items = @items.reject do |item, i|
      item.done == true
    end
    @items
  end

  def print
    p Array.new(70){"-"}.join
    p Array.new(32){"-"}.join + "#{self.label}" + Array.new(32){"-"}.join
    p Array.new(70){"-"}.join
    p "Index   | Item                        | Deadline                      "
    p Array.new(70){"-"}.join

    @items.each_with_index do |item, i|
      p "#{i.to_s.ljust(7)} | #{item.title.ljust(27)} | #{item.deadline.ljust(20)} | #{item.done.to_s.ljust(7)}"
    end

    p Array.new(70){"-"}.join
  end

  def print_full_item(index)
    if valid_index?(index)
      item = @items[index]
      p ("-").ljust(70, "-")
      p "#{item.title.ljust(56)}  | #{item.deadline}"
      p "#{item.description.ljust(70)}"
      p "Done: #{item.done}"
      p ("-").ljust(70, "-")
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

list = List.new('Chores')
p list.add_item('watch black bird1', '2023-12-03', 'description')
p list.add_item('watch black bird2', '2022-06-03', 'description')
p list.add_item('watch black bird3', '2021-08-03', 'description')
p list.add_item('watch black bird4', '2020-11-06', 'description')
p list.add_item('watch black bird5', '2020-12-06', 'description')
list.toggle_item(0)
list.toggle_item(1)
list.toggle_item(3)
list.print
list.purge
# list.sort_by_date!
list.print
list.print_priority
