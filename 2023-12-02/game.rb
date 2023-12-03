#!/usr/bin/env ruby

COLOURS = [ 'red', 'green', 'blue' ]

class Game
  attr_accessor :id, :parts

  # parts have cubes of various colos
  def initialize(id:, parts:)
    @id = id
    @parts = parts.map { |part| Part.new(part) }
  end

  def possible?()
    # "only 12 red cubes, 13 green cubes, and 14 blue cubes"
    is_possible = true
    @parts.each do |part|
      if (part.cubes['green'] || -1) > 13
        is_possible = false
        break
      elsif (part.cubes['blue'] || -1) > 14
        is_possible = false
        break
      elsif (part.cubes['red'] || -1) > 12
        is_possible = false
        break
      end
    end

    is_possible
  end

  def to_s
    """id: #{@id} #{self.possible? ? 'OK' : 'IMPOSSIBLE' }"""
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
