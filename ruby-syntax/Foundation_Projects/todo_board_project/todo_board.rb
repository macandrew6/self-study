require './list'

class Todo_Board
  def initialize(label)
    @list = List.new(label)
  end

  def get_command
    p 'Make a todo with: mktodo <title> <deadline> <optional description>'
    p 'Move a todo up with: up <index> <optional amount>'
    p 'Move a todo down with: down <index> <optional amount>'
    p 'Swap the position of todo with: swap <index_1> <index_2>'
    p 'Sort the todos in descending order with: sort'
    p 'Print the top priority with: priority'
    p 'Print specific todo with: print <optional index>'
    p 'Print todos with: print'
    p 'Exit with: quit'

    print "\nEnter a command: "
    cmd, *args = gets.chomp.split(' ')

    case cmd
    when 'mktodo'
      @list.add_item(*args)
    when 'up'
      index, amt = *args
      @list.up(index.to_i, amt.to_i)
    when 'down'
      index, amt = *args
      @list.down(index.to_i, amt.to_i)
    when 'swap'
      index_1, index_2 = *args
      @list.swap(index_1.to_i, index_2.to_i)
    when 'sort'
      @list.sort_by!
    when 'priority'
      @list.print_priority
    when 'print'
      if args.length > 0
      index = args[0].to_i
        @list.print_full_item(index)
      else
        @list.print
      end
    when 'quit'
      false
    else
      p 'sorry that command is not recognized'
    end

    true
  end

  def run
    until self.get_command == false
      self.get_command
    end
  end
end

tb1 = Todo_Board.new('House')
tb1.run