#!/usr/bin/env ruby

class Game
  attr_accessor :id, :parts, :power

  # parts have cubes of various colos
  def initialize(id:, parts:)
    @id = id
    @parts = parts.map { |part| Part.new(part) }
    @power = cube_powah()
  end

  # Figure out the fewest number of cubes
  # of each colour to make the game possible
  def cube_powah()
    maximums = { 'red' => 0, 'blue' => 0, 'green' => 0 }
    @parts.each do |part|
      maximums['red'] = [part.cubes['red'] || 0, maximums['red']].max
      maximums['blue'] = [part.cubes['blue'] || 0, maximums['blue']].max
      maximums['green'] = [part.cubes['green'] || 0, maximums['green']].max
    end

    maximums['red'] * maximums['blue'] * maximums['green']
  end

  def to_s
    """id: #{@id}
parts:
\t#{@parts.map(&:to_s).join("\n\t")}
minimums: #{cube_powah}
    """
  end
end

# YAGNI buttt...
# "part" = "set" in elf talk
class Part
  attr_accessor :cubes
  def initialize(s)
    @cubes = s
      .split(',')
      .map(&:strip)
      .map { |x| x.split(/\s/) }
      .map { |n,c| {"#{c}" => n.to_i} }
      .reduce({}, &:merge)
  end

  def to_s
    """part: #{@cubes.to_s}"""
  end
end
