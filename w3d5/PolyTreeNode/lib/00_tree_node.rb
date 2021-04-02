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

    
end