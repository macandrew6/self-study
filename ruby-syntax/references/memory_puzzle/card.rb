class Card
  attr_reader :face_value
  
  def initialize(face_value, faced_up=false)
    @face_value = face_value
    @faced_up = false
  end

  def hide

  end

  def reveal

  end

  def to_s

  end

  def ==(other_card)
    p "im running #{@face_value}"
    p other_card.face_value
    @face_value == other_card.face_value
  end
end

card1 = Card.new('A')
card2 = Card.new('B')
card3 = Card.new('A')
p card1==card3