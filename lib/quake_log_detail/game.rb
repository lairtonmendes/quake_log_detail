# frozen_string_literal: true

module QuakeLogDetail
  ##
  # The Game class represents a Quake game and stores information
  # about the game's kills, players, and other statistics.
  #
  class Game
    attr_reader :total_kills, :players, :kills, :kills_by_means, :id

    ##
    # Initializes a new Game object.
    #
    # @param id [Integer] the unique identifier for the game
    def initialize(id)
      @id = id
      @total_kills = 0
      @players = []
      @kills = Hash.new(0)
      @kills_by_means = Hash.new(0)
    end

    ##
    # Adds a kill to the game's statistics based on a log line.
    #
    # @param line [String] a log line containing kill information
    def add_kill(line)
      killer, killed, means_of_death = extract_kill_info(line)

      @total_kills += 1

      if killer != "<world>"
        @kills[killer] += 1
        @players << killer unless @players.include?(killer)
      else
        @kills[killed] -= 1
      end

      @kills_by_means[means_of_death] += 1
      @players << killed unless @players.include?(killed)
    end

    ##
    # Extracts kill information from a log line.
    #
    # @param line [String] a log line containing kill information
    # @return [Array] an array containing the killer, killed, and means of death
    def extract_kill_info(line)
      match_data = line.match(kill_regex)

      return nil unless match_data

      killer = match_data[:killer]
      killed = match_data[:killed]
      means_of_death = match_data[:means_of_death]

      [killer, killed, means_of_death]
    end

    ##
    # Returns the regular expression used to match kill log lines.
    #
    # @return [Regexp] the regular expression for matching kill log lines
    def kill_regex
      /:\s(?<killer>[^:]+)\skilled\s(?<killed>.*?)\sby\s(?<means_of_death>[a-zA-Z_]+)/
    end
  end
end
