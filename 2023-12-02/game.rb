#!/usr/bin/env ruby

COLOURS = [ 'red', 'green', 'blue' ]

class Game
  attr_accessor :id, :parts

  # parts have cubes of various colos
  def initialize(id:, parts:)
    @id = id
    @parts = parts.map { |part| Part.new(part) }
    @minimums = cube_powah()
  end

  # TODO 1. Figure out the fewest number of cubes
  # of each colour to make the game possible
  def cube_powah()
    is_possible = true
    @parts.each do |part|
    end

    is_possible
  end

  def to_s
    """id: #{@id}
parts:
\t#{@parts.map(&:to_s).join("\n\t")}
minimums: #{ 'TODO' } # The lowest possible of each colour
    """
  end
end

# YAGNI buttt...
# "part" = "set" in elf talk
class Part
  attr_accessor :cubes
  def initialize(s)
    # TODO Merge into one obj
    # Coming out [{"red"=>1}, {"blue"=>1}, {"green"=>4}]
    # instead of single obj
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
