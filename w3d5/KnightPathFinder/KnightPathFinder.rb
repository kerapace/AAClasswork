require_relative "../PolyTreeNode/lib/00_tree_node.rb"

class KnightPathFinder
    attr_reader :root_node, :considered_positions
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
        knight_off_sets.map{|a| a.zip(pos).map(&:sum)}.select{|a| a.all? {|k| k >= 0 && k < 8}}
    end

    def build_move_tree
        node_queue = [@root_node]
        while !node_queue.empty?
            curr_node = node_queue.shift
            possible_positions = new_move_positions(curr_node.value)
            new_nodes = possible_positions.map{|pos| PolyTreeNode.new(pos)}
            new_nodes.each do |node|
                curr_node.add_child(node)
                node_queue << node
            end
        end
        @root_node
    end

    def find_path(end_pos)
        path = [end_pos]
        curr_node = @root_node.bfs(end_pos)
        until curr_node.parent == @root_node
            path.unshift(curr_node.parent)
            curr_node = curr_node.parent
        end
        path.unshift(@root_node)
    end
end

kpf = KnightPathFinder.new([0,0])
kpf.build_move_tree
p kpf.find_path([7,7])