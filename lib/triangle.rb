class Triangle
  attr_accessor :isosceles, :equilateral, :scalene

  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
    @unordered_array = [@side_one, @side_two, @side_three]
  end

  def kind
    if @side_one <= 0 && @side_two <= 0 && @side_three <= 0
      raise TriangleError
    elsif @side_one + @side_two <= @side_three || @side_one + @side_three <= @side_two || @side_two + @side_three <= @side_one
      raise TriangleError  
    elsif (@side_one == @side_two && @side_two != @side_three) || (@side_one == @side_three && @side_two != @side_one) || (@side_two == @side_three && @side_three != @side_one)
      :isosceles
    elsif @side_one == @side_two && @side_two == @side_three
      :equilateral
    elsif @unordered_array.sort { |a, b| a <=> b } && @side_one != @side_two || @side_two != @side_three || @side_one != @side_three
      :scalene
    end
  end
end

class TriangleError < StandardError
end