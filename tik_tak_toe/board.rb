module TicTacToe
  class Board
    attr_reader :last_player, :grid

    WINNER_COMBOS = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7]
    ]

    def initialize
      @grid = Array.new(9)
      @last_player = nil
      @resigned = false
    end

    def has_winner?
      WINNER_COMBOS.any? do |combo|
        values = combo.map { |i| grid[i - 1] }

        values.all? && values.uniq.count == 1
      end
    end

    def draw?
      grid.all? && !has_winner?
    end

    def resigned?
      @resigned
    end

    def finished?
      resigned? || has_winner? || draw?
    end

    def valid_number?(cell_number)
      (1..9).include?(cell_number)
    end

    def empty_cell?(cell_number)
      !grid[cell_number - 1]
    end

    def can_play?(cell_number)
      !resigned? && valid_number?(cell_number) && empty_cell?(cell_number)
    end

    def resign!
      @resigned = true
      @last_player = next_player
    end

    def place_mark!(cell_number)
      grid[cell_number - 1] = next_player
      @last_player = next_player
    end

    def next_player
      !@last_player || @last_player == 1 ? 0 : 1
    end
  end
end
