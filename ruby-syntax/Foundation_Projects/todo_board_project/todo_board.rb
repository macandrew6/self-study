require './list'

class Todo_Board
  attr_reader :lists

  def initialize
    # @list = List.new(label)
    @lists = {}
    p @lists
  end

  def print_labels_all
    p "List Labels".ljust(50)
    @lists.each do |label, list|
      p "|   #{label.ljust 46}"
    end
  end

  def get_command
    p 'make a new list with the given label with: mklist <new_list_label>'
    p 'the labels of all lists with: ls'
    p 'all lists with: showall'

    p 'Make a todo with: mktodo <list_label> <title> <deadline> <optional description>'
    p 'Move a todo up with: up <list_label> <index> <optional amount>'
    p 'Move a todo down with: down <list_label> <index> <optional amount>'
    p 'Swap the position of todo with: swap <list_label> <index_1> <index_2>'
    p 'Toggle a items done with: toggle <list_label> <index>'
    p 'Remove todo with: rm <list_label> <item_index>'
    p 'Purge with: <list_label>'
    p 'Sort the todos in descending order with: sort <list_label>'

    p 'Print the top priority with: priority <list_label>'
    p 'Print specific todo with: print <list_label> <optional index>'
    p 'Print todos with: print'

    p 'Exit with: quit'

    print "\nEnter a command: "
    cmd, *args = gets.chomp.split(' ')

    case cmd
    when 'mklist'
      label = args[0]
      @lists[label] = List.new(label)
    when 'ls'
      self.print_labels_all
    when 'showall'
      @lists.each do |label, list|
        list.print
      end
    when 'rm'
      label, index = *args
      @lists[label].remove_item(index.to_i)
    when 'mktodo'
      label, title, deadline, description = *args
      @lists[label].add_item(title, deadline, description)
    when 'up'
      label, index, amt = *args
      @lists[label].up(index.to_i, amt.to_i)
    when 'down'
      label, index, amt = *args
      @lists[label].down(index.to_i, amt.to_i)
    when 'swap'
      label, index_1, index_2 = *args
      @lists[label].swap(index_1.to_i, index_2.to_i)
    when 'toggle'
      label, index = *args
      @lists[label].toggle_item(index.to_i)
    when 'purge'
      label = args[0]
      @lists[label].purge
    when 'sort'
      label = args[0]
      @lists[label].sort_by!
    when 'priority'
      label = args[0]
      @lists[label].print_priority
    when 'print'
      label = args[0]
      if args.length > 1
        index = args[1].to_i
        @lists[label].print_full_item(index)
      else
        @lists[label].print
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

tb1 = Todo_Board.new
tb1.run