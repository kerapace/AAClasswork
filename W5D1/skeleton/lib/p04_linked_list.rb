class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next = self.next
    self.next.prev = self.prev
  end
end

class LinkedList

  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next != @tail ? @head.next : nil
  end

  def last
    @tail.prev != @head ? @tail.prev : nil
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    node = @head.next
    while node != @tail
      if node.key == key
        return node.val
      end
      node = node.next
    end
    nil
  end

  def include?(key)
    node = @head.next
    while node != @tail
      if node.key == key
        return true
      end
      node = node.next
    end
    false
  end

  def append(key, val)
    if !self.include?(key)
      node = Node.new(key,val)
      node.next = @tail
      @tail.prev.next = node
      node.prev = @tail.prev
      @tail.prev = node
    end
  end

  def update(key, val)
    node = @head.next
    while node != @tail
      if node.key == key
        node.val = val
        return node.val
      end
    end
    nil
  end

  def remove(key)
    node = @head.next
    while node != @tail
      if node.key == key
        node.remove
        return true
      end
      node = node.next
    end
    false
  end

  def each
    node = @head.next
    while node != @tail
      yield(node)
      node = node.next
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
