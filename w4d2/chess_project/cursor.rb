require "io/console"

KEYMAP = {
  " " =&gt; :space,
  "h" =&gt; :left,
  "j" =&gt; :down,
  "k" =&gt; :up,
  "l" =&gt; :right,
  "w" =&gt; :up,
  "a" =&gt; :left,
  "s" =&gt; :down,
  "d" =&gt; :right,
  "\t" =&gt; :tab,
  "\r" =&gt; :return,
  "\n" =&gt; :newline,
  "\e" =&gt; :escape,
  "\e[A" =&gt; :up,
  "\e[B" =&gt; :down,
  "\e[C" =&gt; :right,
  "\e[D" =&gt; :left,
  "\177" =&gt; :backspace,
  "\004" =&gt; :delete,
  "\u0003" =&gt; :ctrl_c,
}

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr =&gt; "A")

    if input == "\e" then
      input &lt;&lt; STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input &lt;&lt; STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    case key
    when :space, :return
      return self.cursor_pos
    when :up, :down, :left, :right
      update_pos(MOVES[key])
      return nil
    when :ctrl_c
      Process.exit(0)
    end
  end

  def update_pos(diff)
    @cursor_pos = [cursor_pos[0] + diff[0], cursor_pos[1] + diff[1]].map {|a| a.clamp(0,7)}
    return nil
  end
end