require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      if @board.won? && @board.winner != evaluator
        return true
      else
        return false
      end
    else
      if evaluator == @next_mover_mark
        next_moves = self.children
        next_moves.all? { |move| move.losing_node?(evaluator)}
      else
        next_moves = self.children
        next_moves.any? {|move| move.losing_node?(evaluator)}
      end
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      if @board.won? && @board.winner == evaluator
        return true
      else
        return false
      end
    else
      if evaluator == @next_mover_mark
        next_moves = self.children
        next_moves.any? { |move| move.winning_node?(evaluator) }
      else
        next_moves = self.children
        next_moves.all? { |move| move.winning_node?(evaluator) }
      end
    end
  end

  def show
    puts self.board.rows.map{|row| row.map{|ele| ele.nil? ? "#" : ele}.join(" ")}
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_arr = []
    (0...3).each do |i|
      (0...3).each do |j|
        if @board.empty?([i, j])
          new_board = @board.dup
          new_board[[i,j]] = @next_mover_mark
          children_arr << TicTacToeNode.new(new_board, @next_mover_mark == :x ? :o : :x, [i, j] )
        end
      end
    end
    children_arr
  end
end

node = TicTacToeNode.new(Board.new, :x)
node.board[[0, 0]] = :o
node.board[[2, 2]] = :o
node.board[[0, 2]] = :o
node.losing_node?(:x)