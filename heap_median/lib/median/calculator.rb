require_relative './heap'

module Median
  # calculates median
  class Calculator
    attr_reader :median, :heap

    def initialize(elements = [])
      @heap = Heap.new(elements)
    end

    def median
      @median ||= calculate_median
    end

    def <<(element)
      @heap << element
      @median = calculate_median
    end

    private

    def calculate_median
      elements = @heap.elements
      return 0.0 if elements.empty?
      if elements.size.odd?
        middle_element(elements)
      else
        middle_median(elements)
      end
    end

    def middle_element(elements)
      middle = elements.size / 2
      elements[middle].to_f
    end

    def middle_median(elements)
      middle_right = elements.size / 2
      middle_left = middle_right - 1
      (elements[middle_left] + elements[middle_right]) / 2.0
    end
  end
end
