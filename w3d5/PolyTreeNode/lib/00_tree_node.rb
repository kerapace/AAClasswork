class PolyTreeNode

    attr_reader :value, :parent
    attr_accessor :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        if !@parent.nil?
            @parent.children.delete(self)
        end
        @parent = parent_node
        if !parent_node.nil? && !parent_node.children.include?(self)
            parent_node.children << self
        end
    end

    def add_child(child_node)
        if !self.children.include?(child_node)
            child_node.parent = self
        end
    end

    def remove_child(child_node)
        if !self.children.include?(child_node)
            raise "node is not a child of self"
        end
        child_node.parent = nil
    end

    def dfs(val)
        return self if self.value == val
        self.children.each do |child|
            result = child.dfs(val)
            if !result.nil? && result.value == val
                return result
            end
        end
        nil
    end
    
    def bfs(val)
        node_queue = [self]
        while !node_queue.empty?
            curr_node = node_queue.shift
            return curr_node if curr_node.value == val
            curr_node.children.each do |child|
                node_queue << child
            end
        end
        nil
    end
end
