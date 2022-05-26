class Player
    attr_accessor :token
    def initialize(token)
        @token = token

    end

    def user_input
        puts 'Select a number between 1 and 9'
        $stdin.gets

    end

    


end



