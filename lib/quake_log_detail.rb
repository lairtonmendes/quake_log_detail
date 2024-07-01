# frozen_string_literal: true

require_relative "quake_log_detail/version"
require_relative "quake_log_detail/log_parse"
require_relative "quake_log_detail/game"
require_relative "quake_log_detail/line_helper"

##
# The QuakeLogDetail module provides functionality to parse and analyze
# Quake game logs.
#
# Example usage:
#
#   details = QuakeLogDetail.details('path/to/log/file')
#
module QuakeLogDetail
  ##
  # Parses the log file and returns the details of the games.
  #
  # @param file_path [String] the path to the log file
  # @return [Array<Game>] an array of Game objects with extracted statistics
  def self.details(file_path)
    QuakeLogDetail::LogParse.new(file_path).parse
  end

  ##
  # Returns the version of the QuakeLogDetail module.
  #
  # @return [String] the version of the module
  def self.version
    QuakeLogDetail::VERSION
  end

  ##
  # Generates and prints a scoreboard from the log file.
  #
  # @param file_path [String] the path to the log file
  def self.scoreboard(file_path)
    games = details(file_path)

    puts "====== Scoreboard ======"
    games.each do |game|
      puts "==============================="
      puts "Game #{game.id}"
      puts "Total kills: #{game.total_kills}"
      puts "Players: [#{game.players.join(', ')}]"
      puts "Kills:"
      sorted_kills = game.kills.sort_by { |_, kills| -kills }.to_h

      sorted_kills.each_with_index do |(player, kills), index|
        puts "##{index + 1} - #{player} -> #{kills}"
      end

      puts "Kills by means:"
      sorted_kills_by_means = game.kills_by_means.sort_by { |_, kills_by_means| -kills_by_means }.to_h

      sorted_kills_by_means.each_with_index do |(means, kills), index|
        puts "##{index + 1} - #{means} -> #{kills}"
      end
    end
    puts "==============================="
  end
end
