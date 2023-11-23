class Card
  VALUES = ("A".."Z").to_a

  def self.shuffled_pairs(num_pairs)
    values = VALUES

    if num_pairs > values.length
      values = values + values
    end

    values = values.shuffle.take(num_pairs) * 2
    values.shuffle!
    values.map {|val| self.new(val).face_value}
  end
  
  attr_reader :face_value
  
  def initialize(face_value, faced_up=false)
    @face_value = face_value
    @faced_up = false
  end

  def hide
    @faced_up = false
  end

  def reveal
    @faced_up = true
  end

  def to_s
    faced_up ? face_value.to_s : " "
  end

  def ==(other_card)
    @face_value == other_card.face_value
  end
end

card1 = Card.new('A')
card2 = Card.new('B')
card3 = Card.new('A')
p Card.shuffled_pairs(4)
p card1==card2