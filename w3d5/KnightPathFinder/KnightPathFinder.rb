require_relative "../PolyTreeNode/lib/00_tree_node.rb"

class KnightPathFinder
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def new_move_positions(pos)
        new_positions = KnightPathFinder.valid_moves(pos).reject {|p| @considered_positions.include?(p)}
        @considered_positions += new_positions
        new_positions
    end

    def self.valid_moves(pos)
        knight_off_sets = [[1, 2], [2, 1], [-1, 2], [-2, 1], [1, -2], [2, -1], [-1, -2], [-2, -1]]
        knight_off_sets.map {|a| a.zip(pos).map(&:sum)}
    end
end