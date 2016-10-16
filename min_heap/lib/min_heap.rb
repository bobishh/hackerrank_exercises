require 'pry'
# min-heap implementation
class MinHeap
  attr_reader :elements
  def initialize(elements = [])
    @elements = elements
    begin
      heapify_down
      heapify_up
    end unless @elements.empty?
  end

  def sorted
    twin = self.class.new(@elements.dup)
    sorted = []
    sorted << twin.pop until twin.elements.empty?
    sorted
  end

  def <<(number)
    @elements << number
    heapify_up
  end

  def pop
    swap(0, -1)
    head = @elements.pop
    heapify_down
    head
  end

  def print_tree
    index = 0
    while index <= Math.sqrt(elements.size).ceil
      row = elements[index_slice(index)]
      puts row.compact.join ' - ' unless row.nil?
      index += 1
    end
  end

  private

  def heapify_down
    index = 0
    while index < @elements.size
      smaller = smaller_node(index)
      swap(index, smaller) unless nice_parent?(index)
      index = smaller
    end
  end

  def heapify_up
    index = @elements.size - 1
    while index > 0
      parent = parent_node(index)
      swap(index, parent) unless nice_parent?(parent)
      index = parent
    end
  end

  def swap(index1, index2)
    bubble = @elements[index1]
    @elements[index1] = @elements[index2]
    @elements[index2] = bubble
  end

  def nice_parent?(index)
    return true if node_value(smaller_node(index)).nil?
    node_value(index) < node_value(smaller_node(index))
  end

  def leaf_node?(index)
    index > (@elements.size / 2) - 2
  end

  def node_value(index, direction = nil)
    if direction.is_a? Symbol
      @elements[send("#{direction}_node", index)]
    else
      @elements[index]
    end
  end

  def smaller_node(index)
    left = node_value(index, :left)
    right = node_value(index, :right)
    if right.nil? || right > left
      left_node(index)
    else
      right_node(index)
    end
  end

  def right_node(index)
    left_node(index) + 1
  end

  def left_node(index)
    index * 2 + 1
  end

  def parent_node(index)
    ((index - 2) / 2.0).ceil
  end

  def index_slice(index)
    from = 2**(index - 1) - 1
    to = 2**index - 1
    (from...to)
  end
end
