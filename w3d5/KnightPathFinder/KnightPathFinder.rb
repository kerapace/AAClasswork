require_relative "../PolyTreeNode/lib/00_tree_node.rb"

class KnightPathFinder
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
    end

    def self.new_move_positions(pos)
        knight_off_sets = [[1, 2], [2, 1], [-1, 2], [-2, 1], [1, -2], [2, -1], [-1, -2], [-2, -1]]
        new_positions = knight_off_sets.map {|a| a.zip(pos).inject(:+)}

    end

end