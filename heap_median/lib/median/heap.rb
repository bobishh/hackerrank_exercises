require 'pry'

module Median
  # base min-heap class
  class Heap
    attr_reader :elements
    def initialize(elements = [])
      @elements = elements
    end

    def <<(element)
      @elements << element
      heapify_up(@elements.size - 1)
    end

    def poll
      head = @elements.shift
      tail = @elements.pop
      @elements.unshift(tail) unless tail.nil?
      heapify_down(0)
      head
    end

    def sorted
      twin = Heap.new(@elements.dup)
      sorted = []
      sorted << twin.poll until twin.elements.empty?
      sorted
    end

    private

    def heapify_up(index)
      if index <= 0 || node(index) >= node(index, :parent)
        @elements
      else
        swap_values(index, parent_node_index(index))
        heapify_up(parent_node_index(index))
      end
    end

    def heapify_down(index)
      return @elements if node(index, :left).nil? || nice_parent?(index)
      head = node(index)
      if head > node(index, :smaller)
        swap_values(index, smaller_node_index(index))
        heapify_down(smaller_node_index(index))
      end
    end

    def swap_values(index1, index2)
      bubble = @elements[index1]
      @elements[index1] = @elements[index2]
      @elements[index2] = bubble
    end

    def nice_parent?(index)
      node(index) < node(index, :smaller)
    end

    def node(index, direction = nil)
      if direction.is_a? Symbol
        @elements[send "#{direction}_node_index", index]
      else
        @elements[index.to_i]
      end
    end

    def left_node(index)
      @elements[left_node_index(index)]
    end

    def right_node(index)
      @elements[left_node_index(index)]
    end

    def parent_node_index(index)
      ((index - 2) / 2.0).ceil
    end

    def left_node_index(index)
      index * 2 + 1
    end

    def right_node_index(index)
      index * 2 + 2
    end

    def smaller_node_index(index)
      right = node(index, :right)
      if right.nil? || right > node(index, :left)
        left_node_index(index)
      else
        right_node_index(index)
      end
    end
  end
end

#         a #0
#       /       \
#     b #1        c #2
#    /   \       /  \
#  b1 #3 b2 #4 c1 #5 c2 #6
