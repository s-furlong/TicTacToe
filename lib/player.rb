# frozen_string_literal: true

class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def user_input
    puts 'Select a value between 1 and 9'
    $stdin.gets
  end
end
