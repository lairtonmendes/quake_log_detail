# frozen_string_literal: true

require_relative "line_helper"

module QuakeLogDetail
  ##
  # The LogParse class is responsible for parsing Quake log files
  # and extracting game statistics.
  #
  class LogParse
    include LineHelper
    attr_accessor :games

    ##
    # Initializes a new LogParse object.
    #
    # @param log_file_path [String] the path to the log file
    def initialize(log_file_path)
      @log_file_path = log_file_path
      @games = []
    end

    ##
    # Parses the log file and extracts game statistics.
    #
    # @return [Array<Game>] an array of Game objects with extracted statistics
    def parse
      current_game = nil
      File.foreach(@log_file_path) do |line|
        if line_game_start?(line)
          current_game = Game.new(games.size + 1)
          @games << current_game
        elsif line_game_end?(line)
          current_game = nil
        elsif line_kill?(line) && current_game
          current_game.add_kill(line)
        end
      end

      games
    end
  end
end
