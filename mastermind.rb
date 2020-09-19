class MasterMind

    def initialize()
        @guess_counter = 0

        @display =
"
_|_|_|_ (xx, oo)
_|_|_|_ (xx, oo)
_|_|_|_ (xx, oo)
_|_|_|_ (xx, oo)
_|_|_|_ (xx, oo)
_|_|_|_ (xx, oo)
_|_|_|_ (xx, oo)
_|_|_|_ (xx, oo)
_|_|_|_ (xx, oo)
_|_|_|_ (xx, oo)
_|_|_|_ (xx, oo)
_|_|_|_ (xx, oo)
"

        @option_lst = ["R", "G", "B", "O"]
        @computer_lst = []
        @input_lst = ["x", "x", "x", "x"]
    end

    def display()
        puts @display
    end

    def guess()
        @input = gets

        @display[1 + (@guess_counter * 17)] = @input[0]
        @display[3 + (@guess_counter * 17)] = @input[1]
        @display[5 + (@guess_counter * 17)] = @input[2]
        @display[7 + (@guess_counter * 17)] = @input[3]

        @guess_counter += 1
    end

    def computer_pick()
        for i in (0..3) do
            @computer_lst[i] = @option_lst[rand(4)]
        end
        return @computer_lst
    end

    def score()
        @comparison_lst = @computer_lst.clone
        @strike = 0
        @spare = 0
        @input_lst = @input.split(//)

        for i in (0..3) do
            if @comparison_lst[i] == @input_lst[i]
                @strike += 1
                @comparison_lst[i] = "x"
                @input_lst[i] = "x"
            end
        end

        for i in (0..3) do
            if @comparison_lst.include?(@input_lst[i]) && @comparison_lst[i] != @input_lst[i]
                @spare += 1
            end
        end
        @display[10 + ((@guess_counter - 1) * 17)] = @strike.to_s
        @display[14 + ((@guess_counter - 1)* 17)] = @spare.to_s
    end

    def choice()
        puts "computer or multiplayer"
        @computer_lst = computer_pick()
        @choice = gets.chomp
        if @choice == "computer"
            @computer_lst = computer_pick()
        elsif @choice == "multiplayer"
            puts "The secret code?"
            @computer_lst = gets.split(//)
        else
            puts "Please say that again?"
        end
    end

    def play_game
        puts "RULES:
        1. The pins are represented by the letter R, G, B, O
        2. '3x' represents the pins in the right positions
        3. '1o' represents the right color pins but in the wrong place
        4. You've got twelve tries
        5. The combination can contain multiple of the same color"
        choice()
        while @computer_lst != @input_lst && @guess_counter < 12
            puts "Your guess?"
            guess()
            score()
            display()
            if @strike == 4
                puts "You win!"
                @guess_counter = 13
            end
        end
        if @guess_counter == 12
            puts "You lose!"
            puts @computer_lst
        end
    end
end

game = MasterMind.new()
game.play_game
