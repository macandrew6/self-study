require_relative "room"

class Hotel
  def initialize (name, capacities)
    @name = name
    @rooms = Hash.new

    capacities.each do |room_name, capacity|
      @rooms[room_name] = Room.new(capacity)
    end
  end

  def name 
    capitalized = @name.split.map(&:capitalize)
    capitalized.join(' ')
  end

  def rooms
    @rooms
  end

  def room_exists? (name)
    if @rooms[name]
      return true
    else
      return false
    end
  end

  def check_in (person, room_name)
    if !room_exists? (room_name)
      p 'sorry, room does not exist'
    else
      if @rooms[room_name].add_occupant(person)
        p 'check in successful'
      else
        p 'sorry, room is full'
      end
    end
  end

  def has_vacancy? 
    @rooms.any? do |room, capacity|
      !@rooms[room].full?
    end
  end

  def list_rooms
    @rooms.each do |room, capacity|
      puts "#{room} : #{@rooms[room].available_space}"
    end
  end
end 
