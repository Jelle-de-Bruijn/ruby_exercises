module Moves

    def move_player1
        i = 0
        
        while i < 1
            puts "Move player1"
            input = gets
            move = input.chomp
            
            if @move_hash[move] == 0
                @move_hash[move] = 1
                @display_hash[move] = "X"
                @score_player1 += @score_hash[move]
                i = 1
            else
                puts "Move invalid."
            end
        end
    end

    def move_player2
        i = 0
        
        while i < 1
            puts "Move player2"
            input = gets
            move = input.chomp
            
            if @move_hash[move] == 0
                @move_hash[move] == 2
                @display_hash[move] = "O"
                @score_player2 += @score_hash[move]
                i = 1
            else
                puts "Move invalid"
            end
        end
    end
end

class TicTacToe

    def initialize()
        puts "Name player1"
        @player1 = gets
        puts "Name player2"
        @player2 = gets
        puts "\n"
       
        puts "#{@player1} VS #{@player2}"

        @display_hash = {"aa" => "_", "ab" => "_", "ac" => "_",
                         "ba" => "_", "bb" => "_", "bc" => "_",
                         "ca" => " ", "cb" => " ", "cc" => " "}

        @score_hash = {"aa" => 210010010, "ab" => 201010000, "ac" => 200110001,
                       "ba" => 210001000, "bb" => 201001011, "bc" => 200101000,
                       "ca" => 210000101, "cb" => 201000100, "cc" => 200100110}
        
        @move_hash = {"aa" => 0, "ab" => 0, "ac" => 0,
                      "ba" => 0, "bb" => 0, "bc" => 0,
                      "ca" => 0, "cb" => 0, "cc" => 0}
        
        @score_player1 = 0
        @score_player2 = 0
        @win = 0
    end

    def display
        @display = 
        "  a b c
a #{@display_hash["aa"]}|#{@display_hash["ab"]}|#{@display_hash["ac"]}
b #{@display_hash["ba"]}|#{@display_hash["bb"]}|#{@display_hash["bc"]}
c #{@display_hash["ca"]}|#{@display_hash["cb"]}|#{@display_hash["cc"]}"
        
        puts @display
    end

    def check_score
        @str1 = @score_player1.to_s
        if @str1.include? "3"
            puts "#{@player1} wins!"
            @win = 1
        end

        @str2 = @score_player2.to_s
        if @str2.include? "3"
            puts "#{@player2} wins!!"
            @win = 1
        end
    end
    attr_reader :win
    include Moves
end

def new_tic_tac_toe
    game = TicTacToe.new()
    game.display 
    i = 0
    while game.win == 0 && i != 9
        game.move_player1
        game.display
        game.check_score
        i += 1
        if i == 9
            puts "Draw"
        end
        if game.win == 1 || i == 9
            break
        end
        game.move_player2
        game.display
        game.check_score
        i += 1
    end
end

new_tic_tac_toe

