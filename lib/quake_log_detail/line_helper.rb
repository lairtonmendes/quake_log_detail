# frozen_string_literal: true

module QuakeLogDetail
  ##
  # The LineHelper module provides helper methods to identify different
  # types of lines in the Quake log files.
  #
  module LineHelper
    ##
    # Checks if a line is a kill log line.
    #
    # @param line [String] the log line
    # @return [Boolean] true if the line contains kill information, false otherwise
    def line_kill?(line)
      line.include?("Kill:")
    end

    ##
    # Checks if a line is a game start log line.
    #
    # @param line [String] the log line
    # @return [Boolean] true if the line indicates the start of a game, false otherwise
    def line_game_start?(line)
      line.include?("InitGame:")
    end

    ##
    # Checks if a line is a game end log line.
    #
    # @param line [String] the log line
    # @return [Boolean] true if the line indicates the end of a game, false otherwise
    def line_game_end?(line)
      line.include?("ShutdownGame:")
    end

    module_function :line_kill?, :line_game_start?, :line_game_end?
  end
end
