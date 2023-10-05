class RobotSimulator
  getter direction : Symbol
  getter y : Int32
  getter x : Int32

  def initialize(coordinates : Tuple(Int32, Int32), @direction : Symbol)
    @x = coordinates[0]
    @y = coordinates[1]
  end

  def move(commands : String)
    commands.chars.each do |command|
      case command
      when 'A' then advance
      when 'R' then move_right
      when 'L' then move_left
      end
    end
  end

  def advance
    case direction
    when :north then @y += 1
    when :south then @y -= 1
    when :west then @x -= 1
    when :east then @x += 1
    end
  end

  def move_right
    case direction
    when :north then @direction = :east
    when :south then @direction = :west
    when :west then @direction = :north
    when :east then @direction = :south
    end
  end

  def move_left
    case direction
    when :north then @direction = :west
    when :south then @direction = :east
    when :west then @direction = :south
    when :east then @direction = :north
    end
  end
end
