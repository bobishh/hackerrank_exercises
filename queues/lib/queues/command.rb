module Queues
  # parses stdin commands for queue
  class Command
    COMMANDS = %i(enqueue dequeue head).freeze

    def initialize(string, queue)
      @command_data = parse_command(string)
      @queue = queue
    end

    def run
      @queue.public_send(*@command_data)
    end

    private

    def parse_command(command_string)
      command_data = command_string.split(/\s+/)
      command_data[0] = COMMANDS[command_data[0].to_i - 1]
      command_data
    end
  end
end
