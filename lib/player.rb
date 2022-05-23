class Player

    def initialize(marker)
        @marker = marker
        @board_index = 0
    end

    def select_position
        puts "select number between 1 to 9"
        position = gets.to_i
        if position < 1 || position > 9
            puts "Select a valid number on the board"
            position = gets.to_i
        else
            board_index = position - 1
        end
    end

    def set_mark
        @marker = "X"
    end
end