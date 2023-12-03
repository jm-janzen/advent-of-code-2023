#!/usr/bin/env ruby

COLOURS = [ 'red', 'green', 'blue' ]

class Game
  attr_accessor :id, :parts

  # parts have cubes of various colos
  def initialize(id:, parts:)
    @id = id
    @parts = parts.map { |part| Part.new(part) }

    # XXX Oops, we want to check for possible sets, not totals, duh
    @totals = { 'red' => 0, 'blue' => 0, 'green' => 0 }
    @parts.each do |part|
      @totals['red'] += part.cubes['red'] || 0
      @totals['blue'] += part.cubes['blue'] || 0
      @totals['green'] += part.cubes['green'] || 0
    end
  end

  def possible?()
    # "only 12 red cubes, 13 green cubes, and 14 blue cubes"

    # XXX Well now there are just no possibles :/ ?
    if @totals['red'] > 12
      puts "too many red"
      false
    end
    if @totals['blue'] > 14
      puts "too many blue"
      false
    end
    if @totals['green'] > 13
      puts "too many green"
      false
    end

    true
  end

  def to_s
    { id: @id, parts: @parts, totals: @totals }.to_s
    """
    id: #{@id} #{self.possible? ? 'OK' : 'IMPOSSIBLE' }
    totals: #{@totals}
    """
  end
end

# YAGNI buttt...
# "part" = "set" in elf talk
class Part
  attr_accessor :cubes
  def initialize(s)
    #puts "\t#{s}"
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

  #def to_s
  #  @cubes
  #end
end
