require "metamorpher/node"
require "metamorpher/match"
require "metamorpher/no_match"

module Metamorpher
  class Literal < Node
    specialises Node
    attributes children: []

    def initialize(attributes = {})
      initialize_attributes(attributes)
      children.each { |child| child.parent = self }
    end

    def inspect
      if children.empty?
        "#{name}"
      else
        "#{name}(#{children.map(&:inspect).join(', ')})"
      end
    end

    def match(other)
      if name == other.name
        children_match(other)
      else
        NoMatch.new
      end
    end

    def substitute(substitution)
      Literal.new(
        name: name,
        children: children.map { |child| child.substitute(substitution) }
      )
    end

    def replace(child, replacement)
      Literal.new(
        name: name,
        children: children.map { |original| original == child ? replacement : original }
      )
    end

    private

    def children_match(other)
      children
        .zip(other.children)
        .map { |child, other_child| child.match(other_child) }
        .reduce(Match.new(root: other), :combine)
    end
  end
end