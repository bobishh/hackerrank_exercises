module Median
  class Heap2
    def initialize(elements)
      @elements = elements
      create_max_heap
    end

    def create_max_heap
      (0..@heap_size/2-1).to_a.reverse.each do |index|  
        fix_one_error(index)
      end
    end

    def fix_one_error(index)
      return if leaf_node?(index) || satisfied?(index)

      left_child_key = @elements[left_node_index(index)]
      right_child_key = @elements[right_node_index(index)]

      larger_child = if left_child_key > right_child_key then left_node_index(index)
                     else right_node_index(index) end

      @elements[index], @elements[larger_child] = @elements[larger_child], @elements[index]

      fix_one_error(larger_child)
    end

    def leaf_node?(index)
      index >= heap_size / 2
    end
  end
end
