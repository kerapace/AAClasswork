class PolyTreeNode

    attr_reader :value, :parent
    attr_accessor :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        @parent = node
        if !node.nil? && !node.children.include?(self)
            node.children << self
        end
    end

    def add_child

    end

    def remove_child

    end
end