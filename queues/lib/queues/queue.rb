module Queues
	class Queue
		def initialize
			@data = []
		end

		def enqueue(element)
			@data << element
			true
		end

		def dequeue
			@data.shift
		end

		def head
			puts @data[0]
			@data[0]
		end
	end
end
