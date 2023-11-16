class Card
  def initialize(face_value)
    @face_value = face_value
    @faced_up = false
  end

  def hide

  end
end

card1 = Card.new('A')
p card1