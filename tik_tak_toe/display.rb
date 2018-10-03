module TicTacToe
  class Display
    def get_input
      print "\n$>"

      gets
    end

    def ask_to_start_new_game
      puts "\nDo you want to start new game?(Y/N)"

      get_input
    end

    def ask_name(number_of_players)
      if number_of_players == 0
        puts "\nType your name"
      else
        puts "\nType the name of your opponent"
      end

      get_input
    end

    def ask_to_make_a_move(name)
      puts "\n#{name} make a move!"

      get_input
    end

    def good_bye
      puts "Good bye ^_^"
    end

    def hello(names)
      puts "\nHello #{names.join(' and ')} 🤗"
    end

    def announce_first_player(name)
      puts "\n#{name} shall make first move"
    end

    def cell(board, number)
      case board.grid[number - 1]
      when 0
        'x'
      when 1
        'o'
      else
        ' '
      end
    end

    def board(board)
      print "\n Board           Legend"
      print "\n|---|---|---|   |---|---|---|\n"

      (1..9).each do |i|
        print "| #{cell(board, i)} "

        if i % 3 == 0
          print "|   | #{i - 2} | #{i - 1} | #{i} |"
          print "\n|---|---|---|   |---|---|---|\n"
        end
      end

      puts "To resign and finish this round type 'R'"
    end

    def wrong_number_error
      puts "\nWrong number, should be one of 1-9"
    end

    def taken_number_error
      puts "\nThis space is already taken"
    end

    def chosen_move(name, move)
      puts "\n#{name} marks #{move}"
    end

    def winner(name)
      puts "\nWinner is #{name}!"
    end

    def draw
      puts "\nIt is a draw, nobody wins."
    end

    def resignation(name)
      puts "\n#{name} gave up..."
    end

    def game_ower
      puts "\nGame ower!"
    end
  end
end
