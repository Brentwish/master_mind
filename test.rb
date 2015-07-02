
class Game
  COLORS = ["W", "O", "B", "G", "R", "Y"]
  attr_accessor :win_seq

  def get_seq
    while true do
      print "Your sequence: "
      guess = gets.chomp.upcase.split("")
      if guess.size != 4
        puts "The sequence must be 4 colors long"
      else
        inv_chars = guess - COLORS
        if !inv_chars.empty?
          if inv_chars.size > 1
            puts "#{inv_chars.join(", ")} are invalid colors"
          else
            puts "#{inv_chars.first} is an invalid color"
          end
        else
          return guess
        end
      end
    end
  end

  def compare_seq(seq)
    temp_seq = Array.new(win_seq)
    ret_array = []
    seq.each_with_index do |color, i|
      if seq[i] == temp_seq[i]
        ret_array.push("R")
        seq[i] = nil
        temp_seq[i] = nil
      end
    end
    seq = seq.compact
    temp_seq = temp_seq.compact
    seq.each_with_index do |color, i|
      if temp_seq.include?(color)
        ret_array.push("W")
        temp_seq[temp_seq.find_index(color)] = nil
        seq[i] = nil
        seq = seq.compact
        temp_seq = temp_seq.compact
      end
    end
    return ret_array
  end
end

the_game = Game.new

puts "Please enter the winning sequence"
the_game.win_seq = the_game.get_seq
while true do
  my_seq = the_game.get_seq
  puts "#{my_seq}"
  compare = the_game.compare_seq(my_seq)
  puts "#{compare}"
end
