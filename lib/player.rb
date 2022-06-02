# frozen_string_literal: true

class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def user_input
    $stdin.gets
  end
end
