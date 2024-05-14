require_relative 'player'
require_relative 'question'

class Game
  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    @current_player = @player1
  end

  def switch_turns
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def ask_question
    question = Question.new
    puts "#{@current_player.name}, #{question.ask}"
    answer = gets.chomp.to_i
    if answer == question.correct_answer
      puts "YES! You are correct"
    else
      puts "Seriously? No!"
      @current_player.lose_life
    end
  end

  def play_game
    while @player1.alive? && @player2.alive?
      ask_question
      puts "#{@player1.name}: #{@player1.lives} lives remaining"
      puts "#{@player2.name}: #{@player2.lives} lives remaining"
      switch_turns
    end

    if @player1.alive?
      winner = @player1
      loser = @player2
    else
      winner = @player2
      loser = @player1
    end

    puts "#{winner.name} wins with a score of #{winner.lives}/3."
  end
end