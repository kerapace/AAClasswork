require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board,mark)
    non_losing_moves = []
    node.children.each do |child|
      if child.winning_node?(mark)
        return child.prev_move_pos
      elsif !child.losing_node?(mark)
        non_losing_moves << child.prev_move_pos
      end
    end
    if non_losing_moves.empty?
      raise "This AI cannot lose! Does not compute!"
    end
    return non_losing_moves.sample
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
