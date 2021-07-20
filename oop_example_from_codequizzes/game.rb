# frozen_string_literal: true

class Cell
  attr_accessor :value

  def initialize(value = '')
    @value = value
  end
end

class Player
  attr_reader :color, :name
  def initialize(input)
    @color = input.fetch(:color)
    @name = input.fetch(:name)
  end
end

player1 = Player.new({:name => "John", :color => "white"})
puts player1.color
puts player1.name
