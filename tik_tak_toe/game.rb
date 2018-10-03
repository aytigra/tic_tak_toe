require_relative 'board'
require_relative 'display'

module TicTacToe
  class Game
    attr_reader :board, :display, :players

    def initialize
      @board = nil
      @display = Display.new
      @players = []
    end

    def start
      create_players

      while true
        if !board || wants_new_round?
          start_round
        else
          break
        end
      end

      display.good_bye
    end

    private

    def create_players
      until players.size == 2
        players << display.ask_name(players.size).strip.capitalize
      end

      display.hello(players)
    end

    def wants_new_round?
      display.ask_to_start_new_game[0].upcase == 'Y'
    end

    def start_round
      @board = Board.new
      players.shuffle!

      display.announce_first_player(players[0])
      display.board(board)

      next_turn until board.finished?

      round_results
    end

    def next_turn
      input = ''

      until board.resigned? or board.can_play?(input.to_i)
        input = display.ask_to_make_a_move(players[board.next_player])
        announce_move(input)
      end

      unless board.resigned?
        board.place_mark!(input.to_i)
        display.board(board)
      end
    end

    def announce_move(input)
      if input[0].upcase == 'R'
        board.resign!
      elsif !board.valid_number?(input.to_i)
        display.wrong_number_error
      elsif !board.empty_cell?(input.to_i)
        display.taken_number_error
      else
        display.chosen_move(players[board.next_player], input)
      end
    end

    def round_results
      if board.has_winner?
        display.winner(players[board.last_player])
      elsif board.draw?
        display.draw
      elsif board.resigned?
        display.resignation(players[board.last_player])
      else
        raise "round finished unexpectedly"
      end

      display.game_ower
    end
  end
end
